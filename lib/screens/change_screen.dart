import 'package:diary/controllers/user_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({super.key});

  @override
  State<ChangeScreen> createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  final UserController userController = Get.find(tag: "user_controller");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value){
                if(value != ""){
                  userController.changeUser(value);
                }
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.back();

            }, child: Text("change_username".tr))
          ],
        ),
      ),
    );
  }
}
