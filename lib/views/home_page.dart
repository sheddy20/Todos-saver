import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialape/controllers/auth_controller.dart';
import 'package:socialape/views/drawer.dart';

class Home extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos-Saver"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add Todos",
                prefixIcon: Icon(Icons.list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
            padding: EdgeInsets.only(top: 20.0),
            width: 350.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.signOut,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}
