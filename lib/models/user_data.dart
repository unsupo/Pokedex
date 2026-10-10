import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

/// LEGACY (pre-profile) caught-Pokemon row, keyed by national dex id.
///
/// Kept only so `migrateCaughtDataToProfiles` can read existing installs.
/// New code uses [CaughtPokemon]. Do not add fields here: changing this shape
/// would break reading the existing database.
@collection
@JsonSerializable()
class UserData {
  final Id id;
  bool isCaught;

  UserData({
    required this.id,
    required this.isCaught,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        isCaught: json['isCaught'],
    );
  }
}