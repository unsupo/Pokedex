import 'package:isar_community/isar.dart';

part 'profile.g.dart';

/// A local trainer profile. Each profile owns its own caught Pokemon and caught
/// TCG cards; see [CaughtPokemon] and CaughtTcgCard.
@collection
class Profile {
  Id id;
  String name;

  Profile({this.id = Isar.autoIncrement, required this.name});
}
