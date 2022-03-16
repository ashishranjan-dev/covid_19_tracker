import 'package:covid_19_tracker/views/authscreens/screens/splash.dart';
import 'package:covid_19_tracker/views/homepage_screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:get/get.dart';

import '../views/authscreens/screens/check.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();

  //vaues

  @override
  void onReady() async {
    // run every time auth state changes

    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    // get user data from firestore
    if (_firebaseUser?.uid != null) {}

    if (_firebaseUser == null) {
      // Send to signin
      Get.offAll(() => Splash());
    } else {
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        Get.offAll(() => CheckVaccinated());
      } else {
        Get.offAll(() => HomePageScreen());
      }
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();
}
