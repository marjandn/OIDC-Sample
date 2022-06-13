import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:oidc/ui/home/home_screen.dart';
import 'package:oidc/model/auth0_id_token_model.dart';
import 'package:oidc/storage/secure_shared_pref.dart';
import 'package:oidc/utility/constants.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FlutterAppAuth appAuth = Get.find<FlutterAppAuth>();
  final secureSharedPref = Get.find<SecureSharedPref>();

  loginAuth() async {
    final authoricationTokenRequest = AuthorizationTokenRequest(
        AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        scopes: ['openid', 'profile', 'email', 'offline_access'],
        promptValues: ['login']);

    try {
      final result =
          await appAuth.authorizeAndExchangeCode(authoricationTokenRequest);

      if (result != null) {
        Auth0IdTokenModel? idTokenModel = _parseToken(result.idToken);

        if (idTokenModel != null) {
          await secureSharedPref.saveTokenData(result);
          await secureSharedPref.saveUserInfo(idTokenModel);

          Get.off(HomeScreen());
        }
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  Auth0IdTokenModel? _parseToken(String? idToken) {
    if (idToken != null) {
      final parts = idToken.split(r'.');

      final Map<String, dynamic> json = jsonDecode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

      Auth0IdTokenModel idTokenModel = Auth0IdTokenModel.fromJson(json);

      return idTokenModel;
    }
    return null;
  }
}
