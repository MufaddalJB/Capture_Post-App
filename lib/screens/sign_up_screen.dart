import 'package:capture_post/controller/signup_controller.dart';
import 'package:capture_post/screens/login_screen.dart';
import 'package:capture_post/screens/otp_screen.dart';
import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool status = false;
  @override
  Widget build(BuildContext context) {
    List<String> labels = ["Phone", "Email"];

    final controller = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 214, 214),
        //Color.fromARGB(255, 240, 196, 129),
        // appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0),
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email id",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                    ),
                    controller: controller.emailcontroller,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    obscureText: false),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                    ),
                    controller: controller.agecontroller,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty || int.tryParse(value) == null) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    obscureText: false),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                    ),
                    controller: controller.passwordcontroller,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    obscureText: true),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // controller.emailcontroller.clear();
                        // controller.agecontroller.clear();
                        // controller.phonecontroller.clear();
                        // controller.passwordcontroller.clear();
                        // _formKey.currentState!.save();
                        // SignUpController.instance.registerUser(
                        //     controller.emailcontroller.text.trim(),
                        //     controller.passwordcontroller.text.trim());

                        SignUpController.instance.registerUser(
                            controller.emailcontroller.text.trim(),
                            controller.passwordcontroller.text.trim());
                      }
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              ],
            )));
  }
}
