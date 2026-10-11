import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'binder_page_grid.dart';

/// Hosts the binder's open-book spread (one static left page, a fixed spine,
/// one static right page) and the drag/tap page-turn gesture, per the
/// "Animation" section of docs/features/card-binder.md.
///
/// Turning forward rotates the current right page (hinged at its spine-side,
/// i.e. left, edge) through 180 degrees until it lies flat over the left
/// page's position - which is exactly where the new left page belongs, since
/// turning forward always makes the old right page the new left page. The
/// static right page underneath is already showing the *next* right page the
/// whole time, revealed as the turning leaf rotates away - so "the facing
/// page never moves during the turn" (AC11): it was never part of the
/// turning leaf. Turning backward is the mirror image, hinged at the left
/// page's right edge. No new package: `Transform` + a perspective `Matrix4`,
/// as the design doc specifies.
///
/// [rightPageIndex] is the page currently resting on the right (so the left
/// page is always `rightPageIndex - 1`, or nothing before page 0).
class BinderPageTurner extends StatefulWidget {
  final int rightPageIndex;
  final int pageCount;
  final void Function(int newRightPageIndex) onPageChanged;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget spine;

  const BinderPageTurner({
    super.key,
    required this.rightPageIndex,
    required this.pageCount,
    required this.onPageChanged,
    required this.pageBuilder,
    required this.spine,
  });

  @override
  State<BinderPageTurner> createState() => BinderPageTurnerState();
}

class BinderPageTurnerState extends State<BinderPageTurner>
    with SingleTickerProviderStateMixin {
  /// -1 = turning backward, 0 = idle, 1 = turning forward.
  int _direction = 0;
  late AnimationController _controller;
  double _dragStartX = 0;
  double _pageWidth = 1;

  bool get isTurning => _direction != 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _canTurnForward => widget.rightPageIndex < widget.pageCount - 1;

  bool get _canTurnBack => widget.rightPageIndex > 0;

  /// Turns exactly one page forward or back (AC11) - used by both the
  /// tappable navigation controls and a completed drag past the threshold.
  Future<void> turn(int direction) async {
    if (isTurning) return;
    if (direction > 0 && !_canTurnForward) return;
    if (direction < 0 && !_canTurnBack) return;
    setState(() => _direction = direction);
    await _controller.animateTo(1.0, curve: Curves.easeInOut);
    widget.onPageChanged(widget.rightPageIndex + direction);
    _controller.value = 0;
    setState(() => _direction = 0);
  }

  void _onDragStart(DragStartDetails details) {
    if (isTurning && _controller.isAnimating) return;
    _dragStartX = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final dx = details.globalPosition.dx - _dragStartX;
    final direction = dx < 0 ? 1 : -1;
    if (direction > 0 && !_canTurnForward) return;
    if (direction < 0 && !_canTurnBack) return;
    setState(() {
      _direction = direction;
      _controller.value = (dx.abs() / _pageWidth).clamp(0.0, 1.0);
    });
  }

  Future<void> _onDragEnd(DragEndDetails details) async {
    if (_direction == 0) return;
    final direction = _direction;
    if (_controller.value > 0.5) {
      await _controller.animateTo(1.0, curve: Curves.easeOut);
      widget.onPageChanged(widget.rightPageIndex + direction);
    } else {
      await _controller.animateTo(0.0, curve: Curves.easeOut);
    }
    _controller.value = 0;
    setState(() => _direction = 0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      _pageWidth = constraints.maxWidth / 2;
      final leftPageIndex = widget.rightPageIndex - 1;
      final t = _controller.value;

      // While turning forward, the leaf (old right page) is mid-flight to
      // the left slot, so the static left slot would otherwise show a stale
      // page underneath it - simplest correct fix is to just not render the
      // static slot the leaf is flying toward.
      final hideLeftStatic = _direction > 0;
      final hideRightStatic = _direction < 0;

      // The side NOT being vacated is "already showing what it will be"
      // once the turn completes - a physical binder's next page is already
      // sitting there, under the one being lifted. Found live on the
      // emulator (not caught by any widget test, which only asserts the
      // index change after a turn completes, never mid-turn): without this,
      // both the turning leaf and the static page beneath/behind it on the
      // untouched side showed the *same* page content, since
      // `widget.rightPageIndex` doesn't update until the turn finishes (see
      // `turn()`). Forward: the static right slot should pre-empt to
      // rightPageIndex+1. Backward: the static left slot should pre-empt to
      // leftPageIndex-1.
      final staticLeftIndex = _direction < 0 ? leftPageIndex - 1 : leftPageIndex;
      final staticRightIndex =
          _direction > 0 ? widget.rightPageIndex + 1 : widget.rightPageIndex;

      // The hinge shadow a turning leaf casts onto the page it's lifting off
      // of / settling onto - strongest when the leaf is edge-on (t=0.5),
      // gone at either end of the turn. The single biggest missing depth cue
      // flagged in the "Visual redesign" section of docs/features/card-binder.md
      // (AC18) - without it the turn reads as two flat rectangles swapping,
      // not a sheet of paper lifting off the page beneath it.
      final hingeShadow = math.sin(t * math.pi).clamp(0.0, 1.0);

      return GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      hideLeftStatic
                          ? const SizedBox.expand()
                          : _buildPage(context, staticLeftIndex),
                      if (_direction > 0)
                        _HingeShadow(
                          intensity: hingeShadow,
                          alignment: Alignment.centerRight,
                        ),
                    ],
                  ),
                ),
                widget.spine,
                Expanded(
                  child: Stack(
                    children: [
                      hideRightStatic
                          ? const SizedBox.expand()
                          : _buildPage(context, staticRightIndex),
                      if (_direction < 0)
                        _HingeShadow(
                          intensity: hingeShadow,
                          alignment: Alignment.centerLeft,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (_direction > 0)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: _pageWidth,
                child: _buildLeaf(
                  context,
                  pageIndex: widget.rightPageIndex,
                  angle: t * math.pi,
                  alignment: Alignment.centerLeft,
                ),
              ),
            if (_direction < 0)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: _pageWidth,
                child: _buildLeaf(
                  context,
                  pageIndex: leftPageIndex,
                  angle: -t * math.pi,
                  alignment: Alignment.centerRight,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildPage(BuildContext context, int pageIndex) {
    // No page before page 0 - the static "inside cover" (AC15 of the
    // "Visual redesign" section), not raw background, so the first spread
    // never shows a bare rectangle of the Scaffold behind it.
    if (pageIndex < 0) return const BinderInsideCover();
    if (pageIndex >= widget.pageCount) {
      return const SizedBox.expand();
    }
    return widget.pageBuilder(context, pageIndex);
  }

  Widget _buildLeaf(
    BuildContext context, {
    required int pageIndex,
    required double angle,
    required Alignment alignment,
  }) {
    final showMirrored = angle.abs() > math.pi / 2;
    // A page catches less direct light the more edge-on it is - darkens
    // toward the midpoint of the turn (angle = +/-90deg) and is back to full
    // brightness flat against either page slot. Paired with the drop shadow
    // below, this is what makes the leaf read as a rigid sheet rotating in
    // 3D space rather than a flat image being stretched (AC16/AC18).
    final lightFactor = angle.abs() == 0 ? 1.0 : math.cos(angle).abs();
    final page = showMirrored
        // Past the vertical, counter-flip so the content reads correctly
        // instead of mirrored - the same page's content shown whichever
        // side it's on (no recto/verso modeling - a stated non-goal).
        ? Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(math.pi),
            child: _buildPage(context, pageIndex),
          )
        : _buildPage(context, pageIndex);
    return Transform(
      alignment: alignment,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(angle),
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 18,
            spreadRadius: -4,
          ),
        ]),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            page,
            IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 1 - lightFactor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The soft shadow a turning leaf casts onto the page it's lifting off of or
/// settling onto, at the hinge edge (see [BinderPageTurnerState.build]'s
/// `hingeShadow`). AC18 of the "Visual redesign" section.
class _HingeShadow extends StatelessWidget {
  final double intensity;
  final Alignment alignment;

  const _HingeShadow({required this.intensity, required this.alignment});

  @override
  Widget build(BuildContext context) {
    if (intensity <= 0) return const SizedBox.shrink();
    final onLeftEdge = alignment == Alignment.centerLeft;
    return Positioned.fill(
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: onLeftEdge ? Alignment.centerLeft : Alignment.centerRight,
              end: onLeftEdge ? Alignment.centerRight : Alignment.centerLeft,
              colors: [
                Colors.black.withValues(alpha: 0.35 * intensity),
                Colors.transparent,
              ],
              stops: const [0.0, 0.3],
            ),
          ),
        ),
      ),
    );
  }
}
