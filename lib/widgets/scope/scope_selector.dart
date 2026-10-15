import 'package:flutter/material.dart';
import 'package:pokedex_app/models/scope.dart';

/// One choice in the selector, with the progress shown on it.
class ScopeOption {
  const ScopeOption({
    required this.scope,
    required this.label,
    required this.caught,
    required this.total,
  });

  final Scope scope;
  final String label;
  final int caught;
  final int total;
}

/// Horizontal row of scope choices. Takes its options as data so it can be
/// tested without the providers. See [ScopeSelectorBar] for the connected one.
class ScopeSelector extends StatelessWidget {
  const ScopeSelector({
    super.key,
    required this.current,
    required this.options,
    required this.onSelected,
  });

  final Scope current;
  final List<ScopeOption> options;
  final ValueChanged<Scope> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (final option in options)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(option.label),
                    const SizedBox(width: 6),
                    Text('${option.caught}/${option.total}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                selected: option.scope == current,
                onSelected: (_) => onSelected(option.scope),
              ),
            ),
        ],
      ),
    );
  }
}
