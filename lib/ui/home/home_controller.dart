import 'package:get/get.dart';

import '../../storage/secure_shared_pref.dart';

class HomeController extends GetxController{


  final secureSharedPref = Get.find<SecureSharedPref>();
  Rx<String> name="".obs;
  Rx<String> email="".obs;
  Rx<String> picture="".obs;

  @override
  void onInit() {
    _getUserSavedData();
    super.onInit();
  }

  _getUserSavedData() async{
    name(await secureSharedPref.getUserName());
    email(await secureSharedPref.getUserEmail());
    picture(await secureSharedPref.getUsePicture());
  }
}