import 'package:capture_post/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    var otp_controller=Get.put(OtpController());
      var otp;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CODE VERIFICATION",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              "Enter OTP",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 15.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              fieldWidth: 40.0,
              showFieldAsBox: true,
              keyboardType: TextInputType.number,
              onSubmit: (code){
              otp = code;
              OtpController.instance.verifyOtp(otp);
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {              
                   OtpController.instance.verifyOtp(otp);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: Text("Verify")),
            )
          ],
        ),
      ),
    );
  }
}
