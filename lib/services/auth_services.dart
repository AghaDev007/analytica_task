import 'package:analytica_task/utils/app_images.dart';
import 'package:analytica_task/utils/app_routes.dart';
import 'package:analytica_task/utils/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return 200;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.snackbar("Error", "Invalid email or password",
            backgroundColor: AppTheme.primary, colorText: AppTheme.white);

        return 300;
      } else {
        Get.snackbar("Error", "An unexpected error occurred",
            backgroundColor: AppTheme.primary, colorText: AppTheme.white);

        return 300;
      }
    }
  }

  Future signup(
    String email,
    String password,
    String username,
    String phone,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'phone': phone,
        'username': username,
        'password': password,
        'profilepic': AppImages.user,
      });
      return 200;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Error", "Already exists an account with the given email address");
        return 300;
      }
      if (e.code == 'invalid-email') {
        Get.snackbar("Error", "Email address is not valid");
        return 300;
      }
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "Password is not strong enough");
        return 300;
      } else {
        Get.snackbar("Error", "An unexpected error occurred");

        return 300;
      }
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.login);
      Get.snackbar("Success", "Signed Out Successfully!");
    } catch (e) {
      debugPrint('Error signing out: $e');
      Get.snackbar("Success", "Error Signing Out: $e");
    }
  }

  Future<void> deleteAccountAndUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();

      await FirebaseAuth.instance.currentUser!.delete();
      await FirebaseAuth.instance.signOut();

      Get.snackbar("Success", "User account deleted successfuly");
    } catch (error) {
      print('Error deleting account: $error');
      Get.snackbar("Error", "Error deleting account: $error");
      rethrow;
    }
  }
}
