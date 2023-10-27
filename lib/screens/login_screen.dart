import 'package:capture_post/controller/login_controller.dart';
import 'package:capture_post/screens/sign_in_number.dart';
import 'package:capture_post/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
   final controller= Get.put(LoginController());
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 219, 214, 214),
        body:       
          Stack(
            children:[
              Positioned(
             left: 0,
              width: 350,
              height: 80,
              //left: 0,
             // height: 80,
              child: Container(
              color: Colors.grey,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 80,
              child: Container(
              color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Back !!",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: 100, child: Image.asset("images/camera.png")),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Login To Your Account",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: TextFormField(
                      controller:controller.emailOrNumbercontroller ,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        labelText: "Enter Email/Phone number",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextFormField(
                      controller: controller.passwordcontroller,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          labelText: "Enter Password"),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style:const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey)),
                          clipBehavior: Clip.antiAlias,
                          onPressed: () {
                            // if(int.tryParse(controller.emailOrNumbercontroller.text)==null){
                              LoginController.instance.loginWithEmail(controller.emailOrNumbercontroller.text.trim(), controller.passwordcontroller.text.trim());
                          //   }
                          //   LoginController.instance.loginWithPhoneNumber(controller.emailOrNumbercontroller.text.trim(), controller.passwordcontroller.text.trim());
                           },
                          child: const Text("Login"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const 
                      Text("Not a member?  "),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),],
          ),
        
        );
  }
}
