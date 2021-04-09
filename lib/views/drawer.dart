import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialape/controllers/auth_controller.dart';

class MyDrawer extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              controller.firebaseUser.displayName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              controller.firebaseUser.email,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
