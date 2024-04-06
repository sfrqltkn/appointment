import 'package:appointment/data/model/operation_model.dart';

abstract class AppointmentRepositoryService {
 Future< List<OperationModel>?> getOperations();
}