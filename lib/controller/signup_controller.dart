import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

 static SignUpController get instance => Get.find();
 final  TextEditingController emailcontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  void registerUser(String email, String password){
    Authentication.instance.createUserWithEmailAndPassword(email, password);
  }
  void phoneAuthentication(String phoneNo){
     Authentication.instance.phoneAuthentication(phoneNo);
  }
}