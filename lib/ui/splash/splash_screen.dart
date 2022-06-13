import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oidc/ui/home/home_screen.dart';
import 'package:oidc/ui/login/login_screen.dart';
import 'package:oidc/ui/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget{
   SplashScreen({Key? key}) : super(key: key);

final  _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
         Image.asset("assets/images/logo_image.jpg", width: 300,),
         const  Text("Open ID Connect Sample App", style: TextStyle(fontSize: 18),),
         const SizedBox(height: 40,)
      ]))
    );
  }
}