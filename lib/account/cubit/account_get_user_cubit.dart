import 'package:appointment/data/model/users_model.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountGetCubit extends Cubit<List<Users>> {
  AccountGetCubit() : super(<Users>[]);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userCollection =
      FirebaseFirestore.instance.collection(CollectionKeys.users.value);

  Future<void> getUser() async {
    userCollection
        .where("userId", isEqualTo: _auth.currentUser?.uid)
        .snapshots()
        .listen((event) {
      var usersList = <Users>[];

      var documents = event.docs;
      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var user = Users.fromJson(data, key);

        usersList.add(user);
      }

      emit(usersList);
    });
  }
}
