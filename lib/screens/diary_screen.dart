import 'package:diary/controllers/diary_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({super.key});

  final DiaryController _diaryController = Get.find(tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(
      () => _diaryController.diaryEntries.isEmpty
          ? Text(("Write Something.."))
          : ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _diaryController.diaryEntries[index].dateString,
                            style: Get.textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _diaryController.diaryEntries[index].content,
                            style: Get.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _diaryController.deleteDiaryEntry(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Get.theme.colorScheme.error,
                        ))
                  ]),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 5,
              ),
              itemCount: _diaryController.diaryEntries.length,
            ),
    ));
  }
}
