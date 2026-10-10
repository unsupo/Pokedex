import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/profiles/profile_repository.dart';

/// Adapter (GoF): presents the [ProfileRepository] interface over the real
/// [LocalService], the same way LocalServiceCaughtPokemonRepository does for
/// the CSV feature.
class LocalServiceProfileRepository implements ProfileRepository {
  final LocalService _localService;

  LocalServiceProfileRepository(this._localService);

  @override
  Future<List<Profile>> loadProfiles() => _localService.getAllProfiles();

  @override
  Future<Profile> addProfile(String name) async {
    final profile = Profile(name: name);
    profile.id = await _localService.saveProfile(profile);
    return profile;
  }

  @override
  Future<void> renameProfile(int profileId, String name) async {
    final profile = (await _localService.getAllProfiles())
        .firstWhere((p) => p.id == profileId);
    profile.name = name;
    await _localService.saveProfile(profile);
  }

  @override
  Future<void> resetProfile(int profileId) =>
      _localService.resetCaughtDataForProfile(profileId);
}
