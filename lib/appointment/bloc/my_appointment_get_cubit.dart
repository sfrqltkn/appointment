import 'package:appointment/data/model/my_appointment_model.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentGetCubit extends Cubit<List<MyAppointmentModel>> {
  MyAppointmentGetCubit() : super(<MyAppointmentModel>[]);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userCollection =
      FirebaseFirestore.instance.collection(CollectionKeys.appointments.value);

  Future<void> getMyAppointment() async {
    userCollection
        .where("userId", isEqualTo: _auth.currentUser?.uid)
        .snapshots()
        .listen((event) {
      var myAppointmentList = <MyAppointmentModel>[];

      var documents = event.docs;
      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var userAppo = MyAppointmentModel.fromJson(data, key);

        myAppointmentList.add(userAppo);
      }

      emit(myAppointmentList);
    });
  }
}
