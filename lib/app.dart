import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialape/screens/shared.dart';

import 'controllers/auth_controller.dart';

class App extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.checkUserloggedIn(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text("Error Processing");
        }
        if (snapshot.hasData) {
          return snapshot.data;
        }
        return LoadingWidget();
      },
    );
  }
}
