import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:oidc/storage/secure_shared_pref.dart';
import 'package:oidc/ui/splash/splash_screen.dart';

void main() {

  AllBindings().dependencies();
  runApp( const MyApp());
}
 
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Horley',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  SplashScreen(),
    );
  }
}

class AllBindings extends Bindings{

  @override
  void dependencies() {
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());
        Get.put<SecureSharedPref>(SecureSharedPref());
        Get.put<FlutterAppAuth>(const FlutterAppAuth());
  }
}