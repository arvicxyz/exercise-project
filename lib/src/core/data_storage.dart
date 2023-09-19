import 'package:exercise_project/src/core/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  // Keys
  static const String inputTextKey = "input_text";

  // Instance
  static final DataStorage instance = DataStorage._privateConstructor();

  SharedPreferences? _sharedPrefs;
  SharedPreferences? get sharedPrefs => _sharedPrefs;

  // Constructor
  DataStorage._privateConstructor();

  // Methods
  init() async {
    try {
      _sharedPrefs ??= await SharedPreferences.getInstance();
    } on Exception catch (e) {
      Logger.logException(e);
    }
  }

  Future write(String key, dynamic data) async {
    try {
      if (data is int) {
        await _sharedPrefs?.setInt(key, data);
      } else if (data is bool) {
        await _sharedPrefs?.setBool(key, data);
      } else if (data is double) {
        await _sharedPrefs?.setDouble(key, data);
      } else if (data is String) {
        await _sharedPrefs?.setString(key, data);
      } else if (data is List<String>) {
        await _sharedPrefs?.setStringList(key, data);
      }
    } on Exception catch (e) {
      Logger.logException(e);
    }
  }

  dynamic read<T>(String key) {
    try {
      switch (T) {
        case int:
          return _sharedPrefs?.getInt(key);
        case bool:
          return _sharedPrefs?.getBool(key);
        case double:
          return _sharedPrefs?.getDouble(key);
        case String:
          return _sharedPrefs?.getString(key);
        default:
          return null;
      }
    } on Exception catch (e) {
      Logger.logException(e);
    }
  }

  remove(String key) async {
    try {
      await _sharedPrefs?.remove(key);
    } on Exception catch (e) {
      Logger.logException(e);
    }
  }
}
