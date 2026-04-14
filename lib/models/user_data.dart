import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

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