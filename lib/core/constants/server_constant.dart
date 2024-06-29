import 'dart:io';

class ServerConstant {
  static String serverURL =
      Platform.isAndroid ? "10.0.3:8000" : "http://127.0.0.1:8000";
}
