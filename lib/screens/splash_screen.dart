import 'package:capture_post/controller/splash__controller.dart';
import 'package:capture_post/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
 
  final splashController= Get.put(SplashController());
  
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 186, 186),
      body: Stack(
        children: [
          Obx(()=>
             AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              top:100,
              left:splashController.animate.value? 30: -20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Life Is Short. ", style:Theme.of(context).textTheme.titleLarge),
                  Text("Capture Every Moment.",style:Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ),
          Obx(
            ()=> AnimatedPositioned(
              duration:const Duration(milliseconds: 2000),
              bottom:splashController.animate.value?10:-150,
              right:30,
              width: 300,
              height: 500,
              child: Container(
                child: Image.asset("images/splash_image.png")),
            ),
          )
        ],
      ),
    );
  }
}