import 'package:capture_post/screens/dashboard_screen.dart';
import 'package:capture_post/screens/otp_screen.dart';
import 'package:capture_post/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capture_post/src/repository/authentication_repository.dart';
void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp().then((value) => Get.put(Authentication()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme:const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark,
      textTheme:const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
