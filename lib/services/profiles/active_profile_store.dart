import 'package:shared_preferences/shared_preferences.dart';

/// Where the active profile id is remembered between launches. Kept behind an
/// interface so the provider can be tested without platform storage.
abstract class ActiveProfileStore {
  Future<int?> read();
  Future<void> write(int profileId);
}

class SharedPreferencesActiveProfileStore implements ActiveProfileStore {
  static const _key = 'active_profile_id';

  @override
  Future<int?> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key);
  }

  @override
  Future<void> write(int profileId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, profileId);
  }
}
