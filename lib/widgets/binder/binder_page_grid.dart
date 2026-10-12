import 'package:flutter/material.dart';

import '../../utils/binder/binder_layout.dart';

/// One binder page: a 3x3 grid of pockets (see the "Visual design" section
/// of docs/features/card-binder.md). [pokemonIds] may have fewer than
/// [binderPocketsPerPage] entries on the last page - the remaining cells are
/// just left blank rather than built.
///
/// Redesigned 2026-10-10 (see "Visual redesign" in the design doc) - the
/// original was a single flat-fill `Container`, which read as a painted
/// rectangle rather than a sheet of paper. Now carries its own drop shadow
/// (reads as sitting above the page beneath it) and a soft corner vignette
/// (reads as lit paper, not a flat swatch).
class BinderPageGrid extends StatelessWidget {
  final List<int> pokemonIds;
  final Widget Function(BuildContext context, int pokemonId) pocketBuilder;

  const BinderPageGrid({
    super.key,
    required this.pokemonIds,
    required this.pocketBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        gradient: const RadialGradient(
          center: Alignment(0, -0.6),
          radius: 1.4,
          colors: [
            Color(0xFFFCF8EC), // page card-stock, lit corner.
            Color(0xFFF2EADA),
            Color(0xFFE4D9C3), // darker toward the far edges.
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      padding: const EdgeInsets.all(8),
      // childAspectRatio computed from the *actual* available space, not a
      // fixed 0.7 - see "Fifteenth round" in docs/features/card-binder.md.
      // A hardcoded ratio assumes a 3x3 grid of 0.7-ratio cells always
      // happens to fit in whatever height this page is actually given,
      // which isn't guaranteed to match the binder's own 16:10 aspect
      // ratio - when it doesn't, `GridView`'s non-scrollable viewport
      // silently clips whatever doesn't fit (no overflow warning, since
      // that's just normal Viewport clipping behavior, not a RenderFlex
      // overflow) - reported live as "the bottom row isn't showing the
      // whole cards." Deriving the ratio from `LayoutBuilder`'s real
      // constraints instead makes the 3x3 grid always exactly fill its
      // page, whatever size that page ends up being.
      child: LayoutBuilder(builder: (context, constraints) {
        const crossAxisSpacing = 5.0;
        const mainAxisSpacing = 5.0;
        final cellWidth = (constraints.maxWidth - 2 * crossAxisSpacing) / 3;
        final cellHeight = (constraints.maxHeight - 2 * mainAxisSpacing) / 3;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: cellWidth / cellHeight,
          ),
          itemCount: binderPocketsPerPage,
          itemBuilder: (context, index) {
            if (index >= pokemonIds.length) return const SizedBox.shrink();
            return pocketBuilder(context, pokemonIds[index]);
          },
        );
      }),
    );
  }
}

/// The static "inside cover" shown to the left of page 0, where there is no
/// preceding page (see docs/features/card-binder.md "Visual redesign" -
/// AC15). Reuses the spine's dark pleather gradient so the binder's first
/// spread never shows raw `Scaffold` background.
class BinderInsideCover extends StatelessWidget {
  const BinderInsideCover({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.9, 0),
          radius: 1.6,
          colors: [
            const Color(0xFF433B32),
            const Color(0xFF241F1A),
            Colors.black.withValues(alpha: 0.9),
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.menu_book_outlined,
          size: 36,
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
    );
  }
}
