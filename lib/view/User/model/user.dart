import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;
  User(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
    this.data,
      this.support
      });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Support {
  String? url;
  String? text;

  Support({this.url, this.text});
  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
