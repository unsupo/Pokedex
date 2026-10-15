import 'package:flutter/material.dart';
import 'package:pokedex_app/services/backup_notice.dart';

/// Shows the post-upgrade notice if one is pending. Its action calls [onOpenMenu],
/// which opens the drawer where the existing CSV export lives, so the export
/// isn't duplicated.
Future<void> showBackupNoticeIfPending(BuildContext context,
    {required VoidCallback onOpenMenu}) async {
  if (!await BackupNotice.takePending()) return;
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 10),
      content: const Text('Your caught Pokemon were moved into a profile.'),
      action: SnackBarAction(
        label: 'Open menu',
        onPressed: onOpenMenu,
      ),
    ),
  );
}
