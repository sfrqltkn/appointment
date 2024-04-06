import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/data/repository_services.dart/appointment_repository_service.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentRepository implements AppointmentRepositoryService {
  final FirebaseFirestore _firestore;

  AppointmentRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<OperationModel>?> getOperations() async {
    try {
      var operationList = <OperationModel>[];
      final operationsCollection =
          _firestore.collection(CollectionKeys.operations.value);
      final result = await operationsCollection.get();

      if (result.docs.isNotEmpty) {
        for (var document in result.docs) {
          var key = document.id;
          var data = document.data();
          var operation = OperationModel.fromJson(data, key);

          operationList.add(operation);
        }
      } else {
        debugPrint('No data available.');
      }

      return operationList;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
