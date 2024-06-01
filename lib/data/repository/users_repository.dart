import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:collection';
import 'package:flutter/material.dart';

class UsersRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userCollection =
      FirebaseFirestore.instance.collection(CollectionKeys.users.value);

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return null;
      } else {
        return 'User not found';
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-credential':
            return 'User not found';
          case 'invalid-email':
            return 'Incorrectly formatted Email address';
          case 'network-request-failed':
            return 'Internet Connection Problem';
          default:
            return 'An unexpected error occurred';
        }
      } else {
        return 'An unexpected error occurred';
      }
    }
  }

  Future<String?> signUp(
      {required String firstname,
      required String lastname,
      required String phoneNumber,
      required String email,
      required String password}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        _registerUser(
            userId: userCredential.user!.uid,
            firstname: firstname,
            lastname: lastname,
            phoneNumber: phoneNumber,
            email: email,
            password: password);
        if (!userCredential.user!.emailVerified) {
          await userCredential.user!.sendEmailVerification();
        } else {
          debugPrint("Mail is verified");
        }
        return null;
      } else {
        return 'An unexpected error occurred';
      }
    } catch (e) {
      // print("Hata: $e");
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            return 'This email address is already in use.';
          case 'invalid-email':
            return 'Incorrectly formatted Email address';
          case 'network-request-failed':
            return 'Internet Connection Problem';
          default:
            return 'An unexpected error occurred';
        }
      } else {
        return 'An unexpected error occurred';
      }
    }
  }

  Future<void> _registerUser(
      {required String userId,
      required String firstname,
      required String lastname,
      required String phoneNumber,
      required String email,
      required String password}) async {
    await userCollection.doc().set({
      "userId": _auth.currentUser?.uid,
      "firstname": firstname,
      "lastname": lastname,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password
    });
  }

  Future<void> update(String userId, String firstname, String lastname,
      String phoneNumber, String email) async {
    var updateUser = HashMap<String, dynamic>();
    updateUser["email"] = email;
    updateUser["firstname"] = firstname;
    updateUser["lastname"] = lastname;
    updateUser["phoneNumber"] = phoneNumber;
    userCollection.doc(userId).update(updateUser);
  }
}
