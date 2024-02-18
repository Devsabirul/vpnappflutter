import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securevpnhub/constants.dart';
import 'package:securevpnhub/controllers/server_connect_controller.dart';
import 'package:securevpnhub/views/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ServerController controller = Get.put(ServerController());

  @override
  void initState() {
    controller.getLocalIPAddress();
    Timer(const Duration(seconds: 2), () {
      Get.off(const HomeScreen(), transition: Transition.rightToLeft);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        width: Get.width,
        height: Get.height,
        child: const Center(
          child: Text(
            "Secure, Safe, and Fast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Inter",
            ),
          ),
        ),
      ),
    );
  }
}
