import 'package:flutter/material.dart';

/// The binder's spine: a dark pleather strip with a zipper-pull cue and
/// three fixed metal rings. Deliberately not inside the turning leaf's
/// widget subtree in [BinderPageTurner] - it is a sibling, static `Stack`
/// child, so it stays visually fixed on screen through every page turn
/// (AC12), never animated along with a page.
class BinderSpine extends StatelessWidget {
  final double width;

  const BinderSpine({super.key, this.width = 28});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF1C1A17), Color(0xFF2E2A24), Color(0xFF1C1A17)],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Zipper pull cue, running down one edge.
            Positioned(
              left: 2,
              top: 0,
              bottom: 0,
              child: Container(width: 3, color: Colors.black45),
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
    );
  }
}

class _SpineRing extends StatelessWidget {
  const _SpineRing();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(-0.3, -0.3),
          colors: [Color(0xFFE8E8E8), Color(0xFF8A8A8A), Color(0xFF4A4A4A)],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Center(
        child: Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1C1A17),
          ),
        ),
      ),
    );
  }
}
