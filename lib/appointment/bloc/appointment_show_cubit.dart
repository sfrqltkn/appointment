import 'package:appointment/data/model/my_appointment_model.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_show_state.dart';

class AppointmentShowCubit extends Cubit<AppointmentShowState> {
  AppointmentShowCubit() : super(AppointmentShowState(data: null));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userCollection =
      FirebaseFirestore.instance.collection(CollectionKeys.appointments.value);

  Future<dynamic> getShowAppointment() async {
    emit(state.copyWith(isLoading: true));
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

      emit(state.copyWith(data: myAppointmentList, isLoading: false));
    });
  }
}
