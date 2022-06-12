import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:oidc/login_controller.dart';
import 'package:oidc/login_screen.dart';
import 'package:oidc/storage/secure_shared_pref.dart';

void main() {
  runApp( const MyApp());
}
 
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() { 
        Get.lazyPut<SecureSharedPref>(() => SecureSharedPref());
        Get.lazyPut<FlutterSecureStorage>(() =>const  FlutterSecureStorage());
        Get.put<FlutterAppAuth>(FlutterAppAuth());
      } ,),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Horley',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  LoginScreen(),
    );
  }
}