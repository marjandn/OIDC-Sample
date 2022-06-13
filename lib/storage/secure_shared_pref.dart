import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:oidc/model/auth0_id_token_model.dart';
import 'package:oidc/utility/constants.dart';

class SecureSharedPref{


  final storage = Get.put(FlutterSecureStorage());

  saveTokenData (TokenResponse tokenResponse) async{
    await storage.write(key: REFRESH_TOKEN, value: tokenResponse.refreshToken);
    await storage.write(key: ACCESS_TOKEN, value: tokenResponse.accessToken);
  }

  saveUserInfo(Auth0IdTokenModel model) async{
    await storage.write(key: USER_EMAIL, value: model.email);
    await storage.write(key: USER_NICKNAME, value: model.nickName);
    await storage.write(key: USER_PICTURE, value: model.picture);
  }

  Future<String?> getUserName() async{
    return await storage.read(key: USER_NICKNAME);
  }

  Future<String?> getUserEmail() async{
    return await storage.read(key: USER_EMAIL);
  }

  Future<String?> getUsePicture() async{
    return await storage.read(key: USER_PICTURE);
  }

  Future<String?> getRefreshToken() async{
    String? token = await storage.read(key: REFRESH_TOKEN);
    return token;
  }

}