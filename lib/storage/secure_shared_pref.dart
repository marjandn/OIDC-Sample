import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:oidc/utility/constants.dart';

class SecureSharedPref{


  final storage = Get.find<FlutterSecureStorage>();

  saveToken (String token ) async{
    await storage.write(key: TOKEN_STORAGE_KEY, value: token);
  }

  Future<String> getSavedToken() async{
    String token = await storage.read(key: TOKEN_STORAGE_KEY) ?? "";
    return token;
  }
}