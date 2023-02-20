import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static Future<bool> write(String key, String value) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> read(String key) async {
    try {
      const storage = FlutterSecureStorage();
      return await storage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> delete(String key) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }
}