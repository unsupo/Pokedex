import 'package:pokedex_app/models/tcg_card.dart';

/// Everything TcgApiProvider needs to fetch Pokémon TCG card data,
/// independent of where it actually comes from. [PokemonTcgApiService] (in
/// pokemon_tcg_api_service.dart) is the only production implementation — it
/// hits api.pokemontcg.io — but keeping this as an interface means
/// tests/fakes don't need to extend a class that makes real HTTP calls just
/// to get a constructible stand-in.
abstract class TcgService {
  Future<TcgCard?> getCard(String cardId);
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId);
}
