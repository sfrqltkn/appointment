// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'operation_model.g.dart';

@JsonSerializable()
class OperationModel {
   String? opreationId;
  final String? name;
  final String? price;

  OperationModel({this.name, this.price, this.opreationId});
  factory OperationModel.fromJson(Map<String, dynamic> json, String? key) =>
      _$OperationModelFromJson(json)..opreationId=key;

  Map<String, dynamic> toJson() => _$OperationModelToJson(this);
}


