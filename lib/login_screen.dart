import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:oidc/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController _controller =
      Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Hey! Start Register or Login right now",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Image.asset(
                "assets/images/login_image.jpg",
                height: 400,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () => _controller.loginAuth(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shadowColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      textStyle: const TextStyle(
                          fontFamily: 'Horley',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  child: const Text(
                    "Register / Login",
                  )),
              const SizedBox(
                height: 42,
              ),
            ]),
          )),
    );
  }
}
