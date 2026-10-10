import 'package:flutter/material.dart';

import '../../utils/binder/binder_layout.dart';

/// One binder page: a 3x3 grid of pockets (see the "Visual design" section
/// of docs/features/card-binder.md). [pokemonIds] may have fewer than
/// [binderPocketsPerPage] entries on the last page - the remaining cells are
/// just left blank rather than built.
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
      color: const Color(0xFFF5EFE0), // page card-stock.
      padding: const EdgeInsets.all(6),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 0.7,
        ),
        itemCount: binderPocketsPerPage,
        itemBuilder: (context, index) {
          if (index >= pokemonIds.length) return const SizedBox.shrink();
          return pocketBuilder(context, pokemonIds[index]);
        },
      ),
    );
  }
}
