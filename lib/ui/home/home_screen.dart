import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oidc/ui/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "OIDC",
            ),
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: const Text(
                              "Are you really want to logout?",
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => _controller.logout(),
                                  child: const Text(
                                    "Yes :(",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text("No ")),
                            ],
                          )),
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ))
            ]),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x86575757),
                            blurRadius: 8.0,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: ClipOval(
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/user_placeholer_image.webp',
                            image: _controller.picture.value),
                      ),
                      ),
                ),
                const SizedBox(height: 32),
                Obx(() => Text(
                      _controller.name.value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 24,
                ),
                Obx(() => Text(
                      _controller.email.value,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ));
  }
}
