import 'package:pokedex_app/models/profile.dart';

/// The profile operations [ProfileProvider] needs. Narrow on purpose: the
/// provider doesn't need the whole LocalService (see the SOLID checklist).
abstract class ProfileRepository {
  Future<List<Profile>> loadProfiles();

  /// Stores a new profile and returns it with its assigned id.
  Future<Profile> addProfile(String name);

  Future<void> renameProfile(int profileId, String name);

  /// Clears this profile's caught data. The profile itself is kept.
  Future<void> resetProfile(int profileId);
}
