import 'package:oidc/storage/secure_shared_pref.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashController extends GetxController{

  @override
  onInit(){
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async{
    await Future.delayed(const Duration(seconds: 1));
    String? flag = await Get.find<SecureSharedPref>().getRefreshToken();

                  Get.off((flag != null)? HomeScreen(): LoginScreen());
    
  }
}