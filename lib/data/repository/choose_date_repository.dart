import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';

class ChooseDateRepository {
  final userCollection =
      FirebaseFirestore.instance.collection(CollectionKeys.appointments.value);

  Future<void> updateAndCreate(String userId, String date, String day,
      String time, String price, String operation, String person) async {
    var updateAndCreateAppointment = HashMap<String, dynamic>();
    updateAndCreateAppointment["userId"] = userId;
    updateAndCreateAppointment["date"] = date;
    updateAndCreateAppointment["day"] = day;
    updateAndCreateAppointment["operation"] = operation;
    updateAndCreateAppointment["person"] = person;
    updateAndCreateAppointment["price"] = price;
    updateAndCreateAppointment["time"] = time;
    userCollection.doc(userId).set(updateAndCreateAppointment);
  }
}
