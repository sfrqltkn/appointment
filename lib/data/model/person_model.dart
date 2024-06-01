import 'person_model.g.dart';

class PersonModel {
  String? personId;
  final String? name;
  final String? profile;

  PersonModel({this.name, this.profile, this.personId});
  factory PersonModel.fromJson(Map<String, dynamic> json, String? key) =>
      personModelFromJson(json)..personId = key;

  Map<String, dynamic> toJson() => personModelToJson(this);
}
