import 'package:diary/controllers/user_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'change_screen.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});

  final UserController userController = Get.put(UserController(), tag: "user_controller");

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        SizedBox( height: 10,),

        Obx(() => Text(userController.userName, style: Get.textTheme.headlineMedium,)),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Get.updateLocale(Locale('ru', 'RU'));
            }, child: Text('RUS')),
            ElevatedButton(onPressed: (){
              Get.updateLocale(Locale('esp', 'ESP'));
            }, child: Text('ESP')),
            ElevatedButton(onPressed: (){
              Get.updateLocale(Locale('en', 'US'));
            }, child: Text('ENG'))
          ],
        ),

        SizedBox( height: 10,),
        ElevatedButton(onPressed: (){
          Get.to(() => ChangeScreen());
        }, child: Text('change_username'.tr))
      ],
    )
    );
  }
}
