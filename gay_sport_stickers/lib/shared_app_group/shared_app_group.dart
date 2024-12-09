import 'package:flutter/services.dart';

class SharedAppGroup {
  static Future<void> saveValue(String sname, String key, int value) async {
    try {
      await const MethodChannel('userdef').invokeMethod<num>('setUserDef', {
        'sname': sname,
        'key': key,
        'value': value,
      });
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> getValue(String sname, String key) async {
    try {
      final value =
          await const MethodChannel('userdef').invokeMethod<int>('getUserDef', {
                'sname': sname,
                'key': key,
              }) ??
              0;
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
