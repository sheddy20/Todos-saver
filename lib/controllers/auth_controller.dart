import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialape/screens/shared.dart';
import 'package:socialape/views/home_page.dart';
import 'package:socialape/views/login_page.dart';

class AuthController extends GetxController {
  FirebaseApp firebaseApp;
  User firebaseUser;
  FirebaseAuth firebaseAuth;

  Future<void> initializeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<void> checkUserloggedIn() async {
    if (firebaseApp == null) {
      await initializeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth.currentUser == null) {
      return LoginPage();
    } else {
      firebaseUser = firebaseAuth.currentUser;
      update();
      return Home();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      Get.dialog(
        Center(
          child: LoadingWidget(),
        ),
        barrierDismissible: false,
      );
      await initializeFirebaseApp();
      firebaseAuth = FirebaseAuth.instance;
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredential.user;
      update();
      Get.back();
      Get.to(Home());
    } catch (e) {
      Get.back();
      Get.snackbar("SignIn Error", "Error Signing",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }

  Future<void> signOut() async {
    Get.dialog(
      Center(
        child: LoadingWidget(),
      ),
      barrierDismissible: false,
    );
    await firebaseAuth.signOut();
    Get.back();
    Get.offAll(LoginPage());
  }
}
