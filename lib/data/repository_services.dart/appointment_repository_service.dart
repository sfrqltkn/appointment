import 'package:appointment/data/model/operation_model.dart';

import '../model/person_model.dart';

abstract class AppointmentRepositoryService {
  Future<List<OperationModel>?> getOperations();
  Future<List<PersonModel>?> getPerson();
}