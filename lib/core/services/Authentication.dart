import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authentication {
  String uid;
  final storage = new FlutterSecureStorage();
  isAuthenticated() async {
    this.uid = await storage.read(key: 'uid');
    return this.uid == null ? false : true;
  }
}
