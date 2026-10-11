import 'package:flutter/material.dart';

/// The binder's spine: a dark pleather strip with a zipper-pull cue and
/// three fixed metal rings. Deliberately not inside the turning leaf's
/// widget subtree in [BinderPageTurner] - it is a sibling, static `Stack`
/// child, so it stays visually fixed on screen through every page turn
/// (AC12), never animated along with a page.
///
/// Redesigned 2026-10-10 (see the "Visual redesign" section of
/// docs/features/card-binder.md) after the original version read as a flat
/// grey bar with three dots at real phone width - wider, with a rounded-bevel
/// highlight/shadow pair down each edge and a cast shadow onto both pages, so
/// it reads as a raised cylinder rather than a painted rectangle.
class BinderSpine extends StatelessWidget {
  final double width;

  const BinderSpine({super.key, this.width = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Cast shadow onto both facing pages - the single strongest cue
          // that this is a raised object sitting on top of them, not a flat
          // panel between two others.
          Positioned(
            left: -6,
            top: 0,
            bottom: 0,
            width: width + 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          // The spine body itself: a bevel gradient (dark -> lit -> dark
          // across its width) reads as a rounded, lit cylinder rather than a
          // flat-shaded rectangle.
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF0E0C0A),
                  Color(0xFF433B32),
                  Color(0xFF5A4F42),
                  Color(0xFF342D25),
                  Color(0xFF0E0C0A),
                ],
                stops: [0.0, 0.3, 0.5, 0.75, 1.0],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // A thin bright bevel line just inside the lit edge.
                Positioned(
                  left: width * 0.42,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 1.5,
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                ),
                // Zipper pull cue, running down the dark outer edge.
                Positioned(
                  left: 3,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 3,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _SpineRing(),
                    _SpineRing(),
                    _SpineRing(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpineRing extends StatelessWidget {
  const _SpineRing();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          center: Alignment(-0.35, -0.4),
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFD8D8D8),
            Color(0xFF9A9A9A),
            Color(0xFF5C5C5C),
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF0E0C0A),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.8),
                blurRadius: 1,
                spreadRadius: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
