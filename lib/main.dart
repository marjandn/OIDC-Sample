import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oidc/login_screen.dart';

void main() {
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
      home:  LoginScreen(),
    );
  }
}