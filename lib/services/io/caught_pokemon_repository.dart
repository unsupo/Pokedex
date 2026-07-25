import '../../models/user_data.dart';
import '../local/local_service.dart';

/// The minimal read/write capability [CaughtPokemonTransferService] needs.
///
/// Deliberately narrower than [LocalService] (which has ~35 unrelated
/// resource types) so the transfer service — and its tests — only depend on
/// what caught-pokemon export/import actually touches.
abstract class CaughtPokemonRepository {
  Future<List<UserData>> loadAll();
  Future<void> saveAll(List<UserData> data);
}

class LocalServiceCaughtPokemonRepository implements CaughtPokemonRepository {
  final LocalService _localService;

  LocalServiceCaughtPokemonRepository(this._localService);

  @override
  Future<List<UserData>> loadAll() => _localService.getAllUserData();

  @override
  Future<void> saveAll(List<UserData> data) => _localService.saveAllUserData(data);
}
