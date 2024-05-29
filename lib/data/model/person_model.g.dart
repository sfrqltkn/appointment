import 'person_model.dart';

PersonModel personModelFromJson(Map<String, dynamic> json) => PersonModel(
      name: json['name'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> personModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile': instance.profile,
    };
