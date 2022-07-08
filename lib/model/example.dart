import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Person {
  final String firstName;
  final String lastName;
  final String oakafopak;
  final DateTime dateOfBirth;

  Person({this.firstName, this.oakafopak, this.lastName, this.dateOfBirth});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
