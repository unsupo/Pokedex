import 'package:shared_preferences/shared_preferences.dart';

/// One-time notice shown after an upgrade moved caught data into a profile.
/// Marked when the migration runs, and taken (read and cleared) when shown, so
/// it appears once and never again.
class BackupNotice {
  static const _key = 'backup_notice_pending';

  static Future<void> markPending() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }

  /// Returns whether a notice was pending, and clears it.
  static Future<bool> takePending() async {
    final prefs = await SharedPreferences.getInstance();
    final pending = prefs.getBool(_key) ?? false;
    if (pending) await prefs.remove(_key);
    return pending;
  }
}
