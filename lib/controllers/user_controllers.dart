import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController{

  String get userName => _userName.value;

  RxString _userName = "Unknown User".obs;

  final GetStorage _getStorage = GetStorage();

  @override
  void onInit(){
    _userName.value = _getStorage.read("user_name") ?? "Unknown User";
    super.onInit();
  }

  void changeUser(String value) {
    _userName.value = value;
    _getStorage.write("user_name", value);

  }

}