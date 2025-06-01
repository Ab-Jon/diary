import 'package:diary/controllers/diary_controllers.dart';
import 'package:diary/screens/diary_screen.dart';
import 'package:diary/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryTabScreen extends StatefulWidget {
  const DiaryTabScreen({super.key});

  @override
  State<DiaryTabScreen> createState() => _DiaryTabScreenState();
}

class _DiaryTabScreenState extends State<DiaryTabScreen> {
  final DiaryController _diaryController =
      Get.put(DiaryController(), tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('diary'.tr),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(BottomSheet(
                        enableDrag: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        onClosing: () {},
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    _diaryController.changeEntryText(value);
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _diaryController.addDiaryEntry();

                                      Get.back();
                                    },
                                    child: Text("add".tr))
                              ],
                            ),
                          );
                        }));
                  },
                  icon: Icon(Icons.add))
            ],
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.event),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ]),
          ),
          body: TabBarView(children: [DiaryScreen(), SettingsScreen()]),
        ));
  }
}
