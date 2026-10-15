import 'package:flutter/material.dart';

/// Asks which caught Pokemon to export. Returns true for the current scope,
/// false for all scopes, and null if cancelled, so nothing is exported.
///
/// On derived National the current scope has no rows of its own, so it
/// exports the same as all scopes. The copy says so, rather than promising a
/// narrower file.
Future<bool?> showExportScopeDialog(BuildContext context,
    {bool currentScopeIsDerived = false}) {
  final currentScopeNote = currentScopeIsDerived
      ? 'National (all games) has no rows of its own, so it exports every '
          'caught Pokemon, the same as All scopes.'
      : 'Current scope exports only what the selector shows.';
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Export caught Pokemon'),
      content: Text('$currentScopeNote '
          'All scopes exports everything caught in this profile.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('All scopes'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Current scope'),
        ),
      ],
    ),
  );
}
