import 'package:app_presensi_pegawai/models/submodels/meta.dart';
import 'package:app_presensi_pegawai/models/submodels/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// @JsonSerializable()
// class User {
//   String username, email;
//   int? id;
//   String? createdAt, updatedAt, provider;
//   bool? confirmed, blocked;
//   AttendanceAttributes? attendances;

//   User({
//     required this.username,
//     required this.email,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.provider,
//     this.confirmed,
//     this.blocked,
//     this.attendances,
//   });

//   factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

@JsonSerializable(explicitToJson: true)
class UserAuth {
  String? jwt;
  UserAttributes? user;
  ErrorData? error;

  UserAuth({this.jwt, this.user, this.error});

  factory UserAuth.fromJson(Map<String, dynamic> data) =>
      _$UserAuthFromJson(data);
  Map<String, dynamic> toJson() => _$UserAuthToJson(this);
}
