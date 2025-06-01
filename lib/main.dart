import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'diary_tab_screen.dart';
import 'models/locales.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurple),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime),
        useMaterial3: true,
      ),
      home: DiaryTabScreen(),
      translations: Locales(),
      locale: Locale('en', 'US'),
    );
  }
}
