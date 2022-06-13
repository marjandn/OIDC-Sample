import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oidc/ui/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({Key? key}) : super(key: key);


  final HomeController _controller = Get.put(HomeController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
      
            children: [
            const SizedBox(height: 50,),
            Obx(()=> Container(
              width: 200,
              height: 200,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const  [BoxShadow()],
                image: DecorationImage(image: NetworkImage(_controller.picture.value), fit: BoxFit.cover)
              ),
            ),),
            const SizedBox(height: 32),
          Obx(()=> Text(_controller.name.value , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
          const SizedBox(height: 24,),
          Obx(()=> Text(_controller.email.value , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
          const SizedBox(height: 24,),
          ],),
        ),
      )
    );
  }
}
