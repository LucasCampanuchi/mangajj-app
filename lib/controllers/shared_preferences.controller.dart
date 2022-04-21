import '../services/shared_preferences.service.dart';

class SharedPreferencesController {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  Future<bool> deleteData(String key) async {
    return await sharedPreferencesService.deleteData(key);
  }

  Future<void> insertData(String key, String value) async {
    await sharedPreferencesService.saveData(key, value);
  }

  Future<String?> readData(String key) async {
    return await sharedPreferencesService.readData(key);
  }
}
