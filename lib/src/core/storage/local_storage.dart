import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AsbstractSgLocalStorage {
  Future<dynamic> getPhotosFromStore();
  Future<void> storePhotosFromStore(dynamic value);
}
//snapgrid storage class

class SgStoreKey {
  static const String getPhotoKeys = "sgPhotoKey";
}

class SgLocalStorage implements AsbstractSgLocalStorage {
  SgLocalStorage._internal();
  static final SgLocalStorage _instance = SgLocalStorage._internal();

  factory SgLocalStorage() {
    return _instance;
  }
  final LocalStorage _localStorage = LocalStorage();
  @override
//gets photos response from store
  Future<dynamic> getPhotosFromStore() async {
    final getphoto = await _localStorage.getData(SgStoreKey.getPhotoKeys);
    final serializeStore = json.decode(getphoto);
    return serializeStore;
  }

  //stores photos response
  @override
  Future<void> storePhotosFromStore(dynamic value) async {
    await _localStorage.saveData(SgStoreKey.getPhotoKeys, value);
  }
}

class LocalStorage {
  LocalStorage._internal();
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      prefs.setString(key, json.encode(value));
    }
  }

  Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
