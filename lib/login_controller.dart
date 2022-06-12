import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oidc/utility/constants.dart';

class LoginController extends GetxController {

  final appAuth = FlutterAppAuth();
  loginAuth() async{
    final authoricationTokenRequest =
        AuthorizationTokenRequest(AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER , scopes: [
          'openid', 'profile', 'email', 'offline_access'
        ]);

        final result= await appAuth.authorizeAndExchangeCode(authoricationTokenRequest);

      print(result);
  }
}
