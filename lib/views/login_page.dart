import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialape/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Todos-Saver",
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            MaterialButton(
              onPressed: controller.signInWithGoogle,
              color: Colors.black,
              textColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              padding: EdgeInsets.all(10.0),
              child: Text("Continue with google"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
