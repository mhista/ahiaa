import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PLocalStorage {
  static PLocalStorage? _instance;
  static SharedPreferences? _prefs;
  static String? _userBucket;
  PLocalStorage._internal();

  /// Get the singleton instance
  factory PLocalStorage.instance() {
    _instance ??= PLocalStorage._internal();
    return _instance!;
  }

  /// Initialize SharedPreferences and set user bucket
  static Future<void> init(String userId) async {
    _prefs ??= await SharedPreferences.getInstance();
    _userBucket = "user_$userId"; // Create bucket per user
    debugPrint("User bucket: $_userBucket");
  }

  /// Get the key with the user bucket prefix
  String _getKeyWithBucket(String key) {
    if (_userBucket != null) {
      return '$_userBucket.$key';
    }
    return key;
  }

  /// Save data generically
  Future<void> saveData<T>(String key, T value) async {
    if (_prefs == null) return;
    key = _getKeyWithBucket(key);
    debugPrint("Saving key: $key, value: $value");
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

  /// Retrieve data generically
  T? getData<T>(String key) {
    if (_prefs == null) return null;
    key = _getKeyWithBucket(key);
    return _prefs!.get(key) as T?;
  }

  /// Remove a specific key
  Future<void> removeData(String key) async {
    if (_prefs != null) {
      key = _getKeyWithBucket(key);
      await _prefs!.remove(key);
    }
  }

  /// Check if a key exists
  bool containsKey(String key) {
    if (_prefs == null) return false;
    key = _getKeyWithBucket(key);
    return _prefs!.containsKey(key);
  }

  /// Clear all stored data (use with caution)
  Future<void> clearAll() async {
    if (_prefs != null) await _prefs!.clear();
  }
}
