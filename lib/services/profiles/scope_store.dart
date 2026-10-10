import 'package:shared_preferences/shared_preferences.dart';

/// Where each profile's last-chosen scope is remembered. Behind an interface
/// so the provider can be tested without platform storage.
abstract class ScopeStore {
  Future<String?> read(int profileId);
  Future<void> write(int profileId, String scopeKey);
}

class SharedPreferencesScopeStore implements ScopeStore {
  static String _key(int profileId) => 'scope_$profileId';

  @override
  Future<String?> read(int profileId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key(profileId));
  }

  @override
  Future<void> write(int profileId, String scopeKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key(profileId), scopeKey);
  }
}
