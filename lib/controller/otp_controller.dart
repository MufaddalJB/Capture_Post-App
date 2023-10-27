import 'package:capture_post/screens/dashboard_screen.dart';
import 'package:capture_post/screens/sign_up_screen.dart';
import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{

  static OtpController get instance => Get.find();

  void verifyOtp(String otp)async{
  var isverified= await Authentication.instance.verifyOtp(otp);
  isverified ? Get.offAll(()=>const SignUpScreen()):Get.back();
  }
}