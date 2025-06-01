import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../models/diary_entry.dart';

class DiaryController extends GetxController {
  List<DiaryEntry> get diaryEntries => [..._diaryEntries].toList();

  final RxList<DiaryEntry> _diaryEntries = <DiaryEntry>[].obs;

  String _entryText = "";

  final GetStorage _getStorage = GetStorage();

  @override
  void onInit() {
    final List<dynamic> data = _getStorage.read("diary_entries") ?? [];
    List<DiaryEntry> entries = [];

    for (var element in data) {
      final String date = element["dateString"];
      final String content = element["content"];

      data.add(DiaryEntry(dateString: date, content: content));
    }
    _diaryEntries.value = entries;

    super.onInit();
  }

  void changeEntryText(String text) {
    _entryText = text;
  }

  void addDiaryEntry() {
    if (_entryText != "") {
      initializeDateFormatting();

      DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale.toString());
      String dateString = dateFormat.format(DateTime.now());

      _diaryEntries
          .add(DiaryEntry(dateString: dateString, content: _entryText));

      List data = [];
      for (DiaryEntry entry in _diaryEntries) {
        data.add({"dateString": entry.dateString, "content": entry.content});
      }
      _getStorage.write("diary_entries", data);
    }
    _entryText = "";
  }

  void deleteDiaryEntry(int index) {
    List data = [];
    for (DiaryEntry entry in _diaryEntries) {
      data.add({"dateString": entry.dateString, "content": entry.content});
    }
    _getStorage.write("diary_entries", data);
    _diaryEntries.removeAt(index);
  }
}
