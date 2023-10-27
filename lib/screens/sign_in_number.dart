import 'package:capture_post/controller/signup_controller.dart';
import 'package:capture_post/screens/login_screen.dart';
import 'package:capture_post/screens/otp_screen.dart';
import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
 
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
   String val="";
   @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 214, 214),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SIGN IN",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                  height: 30.0,
                ),
              Text("Enter Your Phone Number to continue",
                  style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                  height: 20.0,
                ),
              IntlPhoneField(
                controller: controller.phonecontroller,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
              setState(() {
                val = phone.completeNumber;
              });
                },
              ),
              
                 Center(
                  child: ElevatedButton(
                    onPressed: () {
                      SignUpController.instance.phoneAuthentication(
                          val);
                      Get.to(() => const OtpScreen());
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      "Verify",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              
            ],
          ),
        ));
  }
}
