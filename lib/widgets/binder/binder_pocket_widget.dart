import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/pokeapi/pokemon.dart';
import '../../utils/binder/binder_pocket.dart';

/// Renders one binder pocket - the three states from the "Pocket model"
/// section of docs/features/card-binder.md (plus the data-model's
/// named-but-imageless edge case). Pure presentation: [view] says what to
/// show, [pokemon] supplies the sprite for the owned-indicator state.
class BinderPocketWidget extends StatelessWidget {
  final Pokemon pokemon;
  final BinderPocketView view;
  final VoidCallback onTap;

  const BinderPocketWidget({
    super.key,
    required this.pokemon,
    required this.view,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final view = this.view;
    return Semantics(
      button: true,
      label: _semanticLabel(view),
      child: GestureDetector(
        key: Key('binder-pocket-${pokemon.id}'),
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: switch (view) {
            SelectedPocket() =>
              _SleeveCard(imageUrl: view.card.images?.small, label: view.card.name ?? ''),
            SelectedPocketMissingData() =>
              _SleeveCard(imageUrl: null, label: view.cardId),
            OwnedPocket() => _OwnedIndicator(pokemon: pokemon),
            EmptyPocket() => const _EmptyPocket(),
          },
        ),
      ),
    );
  }

  String _semanticLabel(BinderPocketView view) {
    final name = pokemon.name;
    return switch (view) {
      SelectedPocket(card: final card) =>
        '$name: showing ${card.name ?? card.id}',
      SelectedPocketMissingData() => '$name: selected card, loading',
      OwnedPocket() => '$name: owned, none chosen to display',
      EmptyPocket() => '$name: none owned, tap to add a card',
    };
  }
}

/// State 1 (and the missing-data edge case): a card sitting in a plastic
/// sleeve - a recessed border, a diagonal glare band, and the art sized a
/// touch smaller than the pocket so a sliver of page card-stock shows
/// around it (see "Visual design" in the design doc).
class _SleeveCard extends StatelessWidget {
  final String? imageUrl;
  final String label;

  const _SleeveCard({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          // The sleeve's recessed inner-shadow edge, plus a slight lift off
          // the page itself - a card in a sleeve sits a hair proud of the
          // page card-stock (see "Visual redesign" in the design doc).
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: -1,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black45,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.black12, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: imageUrl == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 9, color: Colors.black54),
                      ),
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    memCacheWidth: 200,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon, color: Colors.grey),
                  ),
          ),
          // The sleeve's plastic glare: a soft diagonal band of light.
          const Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white24,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white10,
                    ],
                    stops: [0.0, 0.35, 0.65, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// State 2: this Pokemon's own list-row sprite, dimmed/greyscale, with no
/// card frame - distinct from both a real card and the empty "+".
class _OwnedIndicator extends StatelessWidget {
  final Pokemon pokemon;

  const _OwnedIndicator({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColorFiltered(
          // The same greyscale matrix the uncaught pokeball icon already
          // uses (PokemonListItem / the details screen's FAB) - deliberately
          // duplicated here rather than shared, since reaching into those
          // unrelated widgets to extract a constant isn't worth the coupling
          // for four lines of literals.
          colorFilter: const ColorFilter.matrix(<double>[
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0.2126, 0.7152, 0.0722, 0, 0,
            0, 0, 0, 1, 0,
          ]),
          child: CachedNetworkImage(
            imageUrl: pokemon.imageUrl,
            memCacheWidth: 150,
            errorWidget: (context, url, error) =>
                const Icon(Icons.catching_pokemon, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

/// State 3: nothing owned - just the "+" affordance.
class _EmptyPocket extends StatelessWidget {
  const _EmptyPocket();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        // A recessed, empty sleeve - an inset shadow (via a border plus a
        // negative-spread inner glow) rather than a plain outline, so it
        // reads as a cut-out pocket, not a drawn box (see "Visual redesign").
        color: Colors.black.withValues(alpha: 0.05),
        border: Border.all(color: Colors.black26, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 3,
            spreadRadius: -1,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Icon(Icons.add_circle_outline,
          color: Colors.black.withValues(alpha: 0.35), size: 26),
    );
  }
}
