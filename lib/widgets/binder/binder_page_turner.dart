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
///
/// A turn moves the spread by *two* page-groups, not one - see "Twelfth
/// round" in docs/features/card-binder.md. [rightPageIndex] is always even
/// (0, 2, 4, ...): the very first spread shows page 0 alone against the
/// inside cover, and every spread after that shows a genuinely new pair
/// (page 1|2, then 3|4, then 5|6, ...) rather than sliding by one column at
/// a time and re-showing a page that was already visible a moment ago -
/// reported live: "turning the page should advance two pages instead of
/// just one... p1 turn then p2 p3 turn then p4 p5". `_pageStep` below is
/// the single knob this depends on.
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

  /// How many page-groups a single turn advances the spread by - see the
  /// class doc. The drag/flip animation itself still only ever shows *one*
  /// leaf's worth of motion (one page-width of drag, one 180-degree flip);
  /// only the resulting index jump and the leaf's landing content use this.
  static const int _pageStep = 2;

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

  // There's something to turn to as long as *any* further page-group
  // exists beyond the current right page - even just one, landing alone on
  // the left against a blank right slot (the mirror image of the first
  // spread's page-0-alone-against-the-cover), not only when a full pair
  // remains.
  bool get _canTurnForward => widget.rightPageIndex + 1 < widget.pageCount;

  bool get _canTurnBack => widget.rightPageIndex > 0;

  /// Turns one spread's worth forward or back (AC11, revised - see the
  /// class doc) - used by both the tappable navigation controls and a
  /// completed drag past the threshold. [direction] is just a sign (+1/-1,
  /// unchanged call sites); the actual index jump is `_pageStep` pages.
  Future<void> turn(int direction) async {
    if (isTurning) return;
    if (direction > 0 && !_canTurnForward) return;
    if (direction < 0 && !_canTurnBack) return;
    setState(() => _direction = direction);
    await _controller.animateTo(1.0, curve: Curves.easeInOut);
    widget.onPageChanged(widget.rightPageIndex + direction * _pageStep);
    _controller.value = 0;
    setState(() => _direction = 0);
  }

  // Driven externally by CardBinderScreen's InteractiveViewer
  // (onInteractionStart/Update/End), not by a GestureDetector of this
  // widget's own - see "Sixth round" in docs/features/card-binder.md
  // (AC31). A `GestureDetector` here, sibling to InteractiveViewer's own
  // scale/pan recognizer, reliably won every single-finger touch before a
  // second finger ever got a chance to turn it into a pinch (recognizers
  // don't get a second look once the arena resolves), so pinch-to-zoom
  // could never actually *start*. Routing through InteractiveViewer's own
  // gesture stream instead means there is exactly one recognizer in the
  // whole subtree - nothing to compete with - and `details.pointerCount`
  // tells the caller the moment a second finger joins, so it can cancel
  // the in-progress page-turn and hand off to native pinch-zoom cleanly.

  /// Call from `onInteractionStart` when the gesture begins with exactly
  /// one pointer and the binder isn't already zoomed in. [globalX] is that
  /// pointer's (focal point's) global x position.
  void startExternalDrag(double globalX) {
    if (isTurning && _controller.isAnimating) return;
    _dragStartX = globalX;
  }

  /// Call from `onInteractionUpdate` for as long as the gesture stays a
  /// single pointer. [globalX] is the current focal point's global x.
  void updateExternalDrag(double globalX) {
    final dx = globalX - _dragStartX;
    final direction = dx < 0 ? 1 : -1;
    if (direction > 0 && !_canTurnForward) return;
    if (direction < 0 && !_canTurnBack) return;
    setState(() {
      _direction = direction;
      _controller.value = (dx.abs() / _pageWidth).clamp(0.0, 1.0);
    });
  }

  /// Call when a second pointer joins mid-gesture (it's becoming a pinch,
  /// not a page turn) - snaps back to flat with no page change, same as a
  /// drag released short of the halfway threshold.
  void cancelExternalDrag() {
    if (_direction == 0) return;
    _controller.value = 0;
    setState(() => _direction = 0);
  }

  /// Call from `onInteractionEnd` to resolve an in-progress external drag:
  /// completes the turn past the halfway threshold, snaps back otherwise.
  Future<void> endExternalDrag() async {
    if (_direction == 0) return;
    final direction = _direction;
    if (_controller.value > 0.5) {
      await _controller.animateTo(1.0, curve: Curves.easeOut);
      widget.onPageChanged(widget.rightPageIndex + direction * _pageStep);
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
      final staticLeftIndex =
          _direction < 0 ? leftPageIndex - _pageStep : leftPageIndex;
      final staticRightIndex = _direction > 0
          ? widget.rightPageIndex + _pageStep
          : widget.rightPageIndex;

      // Both static slots always render their real content, full stop - a
      // previous version additionally force-blanked whichever slot the
      // leaf departs from/arrives at (`hideLeftStatic`/`hideRightStatic`)
      // for the leaf's *entire* animation, not just the portion it's
      // actually covering. Found live (see "Third round" in
      // docs/features/card-binder.md): since the leaf only sweeps across
      // that slot progressively as its rotation angle passes 90 degrees,
      // blanking it outright exposed the `_BinderLeatherBase` background
      // behind the Stack for roughly the first half of every turn, instead
      // of the correct, unchanged page that's still sitting there until the
      // leaf (painted after this Row, so already on top) actually lands on
      // it. No hiding is needed at all - the leaf's own painting order
      // already covers this slot exactly when it should.

      // The hinge shadow a turning leaf casts onto the page it's lifting off
      // of / settling onto - strongest when the leaf is edge-on (t=0.5),
      // gone at either end of the turn. The single biggest missing depth cue
      // flagged in the "Visual redesign" section of docs/features/card-binder.md
      // (AC18) - without it the turn reads as two flat rectangles swapping,
      // not a sheet of paper lifting off the page beneath it.
      final hingeShadow = math.sin(t * math.pi).clamp(0.0, 1.0);

      final spread = Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _buildPage(context, staticLeftIndex),
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
                    _buildPage(context, staticRightIndex),
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
          // The leaf's box must sit flush against the spine on the side
          // it's departing from - its hinge-side edge is the spine, the
          // far edge swings through the turn. Found live (not caught by
          // any widget test, which never asserts the rotation's geometry -
          // see Status): this was previously anchored to the *outer*
          // screen edge instead, which pivoted the whole turn off the
          // side of the screen rather than at the spine in the middle.
          if (_direction > 0)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: _pageWidth,
              child: _buildLeaf(
                context,
                fromPageIndex: widget.rightPageIndex,
                toPageIndex: widget.rightPageIndex + (_pageStep - 1),
                angle: t * math.pi,
                alignment: Alignment.centerLeft,
              ),
            ),
          if (_direction < 0)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: _pageWidth,
              child: _buildLeaf(
                context,
                fromPageIndex: leftPageIndex,
                toPageIndex: widget.rightPageIndex - _pageStep,
                angle: -t * math.pi,
                alignment: Alignment.centerRight,
              ),
            ),
        ],
      );

      // No GestureDetector of this widget's own - see the comment on
      // startExternalDrag above. CardBinderScreen drives the turn directly
      // via InteractiveViewer's own gesture callbacks.
      return spread;
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
    required int fromPageIndex,
    required int toPageIndex,
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
    // Past the vertical, the leaf shows the page-group that will actually
    // occupy the slot it's landing in, not the one it was carrying when it
    // lifted off - a binder spread shows two *different* page-groups side
    // by side (ids N, N+1 - see the class doc's "Twelfth round"), so a
    // completed turn has to bring genuinely new content into view, not
    // just re-show whichever page the flipping leaf started with. The swap
    // happens exactly at this edge-on midpoint, paired with the existing
    // counter-flip below - the least noticeable moment for it, the same
    // way a real sheet's front and back are both invisible exactly edge-on.
    final pageIndex = showMirrored ? toPageIndex : fromPageIndex;
    final page = showMirrored
        // Past the vertical, counter-flip so the content reads correctly
        // instead of mirrored.
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
