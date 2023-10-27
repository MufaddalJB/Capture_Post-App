import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
   final  TextEditingController emailOrNumbercontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  void loginWithEmail (String email, String password)async{
    await Authentication.instance.signInWithUserWithEmailAndPassword(email, password);

  }
  void loginWithPhoneNumber (String phoneNumber, String password)async{
    await Authentication.instance.signInWithUserWithEmailAndPassword(phoneNumber, password);

  }
  void logout ()async{
    await Authentication.instance.logout();

  }
  
}