import 'package:get/get.dart';

class Locales extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": {
      "change_username": "Change Username",
      "diary": "Diary",
      "add": "Add"
    },

    "ru_RU": {
      "change_username": "Изменить Имя",
      "diary": "Дневник",
      "add": "Добавить"
    },
    "esp_ESP":{
      "change_username": "Cambiar Nombre",
      "diary": "Diário",
      "add": "Agregar"
    }
  };
}