import 'package:capture_post/controller/login_controller.dart';
import 'package:capture_post/src/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(children: [
          Container(
            height: 300,
            color: Colors.blue,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  PopupMenuButton<String>(
                    child: CircleAvatar(),
                    itemBuilder: (BuildContext context) {
                      return {'Profile', 'Logout'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                    onSelected: (String choice) {
                      // Handle the selected option (Profile or Logout)
                      if (choice == 'Profile') {
                        // Implement the profile action
                      } else if (choice == 'Logout') {
                        Authentication.instance.logout();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 450,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              child: Container(
                color: Colors.black,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
