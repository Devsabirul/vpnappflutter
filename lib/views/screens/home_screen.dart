import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:securevpnhub/constants.dart';
import 'package:securevpnhub/controllers/server_connect_controller.dart';
import 'package:securevpnhub/views/screens/country_screen.dart';
import 'package:securevpnhub/views/screens/networktest_screen.dart';
import 'package:securevpnhub/views/screens/premium_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServerController controller = Get.put(ServerController());

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: primaryColor,
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset(
                "assets/images/homebg.png",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 24),
                child: Container(
                  margin: EdgeInsets.only(top: paddingTop),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(const NetWorkTestScreen(),
                                  transition: Transition.noTransition);
                            },
                            child: const Icon(
                              Icons.info_outline_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const Text(
                            "SECURE VPN HUB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.light_mode_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      Obx(
                        () => controller.isConnected.value
                            ? const Text(
                                "Current IP 15.33.0.1",
                                style: TextStyle(
                                  color: Color(0xff1D5BFA),
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : controller.isConnecting.value
                                ? const Text("")
                                : Text(
                                    "Current IP ${controller.localip.value}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                    ),
                                  ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => controller.isConnected.value
                            ? const Text(
                                "You are connected",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const Text(
                                "Not Connected",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InkWell(
                        onTap: () {
                          controller.isConnecting.value = true;
                          Timer(const Duration(seconds: 3), () {
                            controller.isConnected.value = true;
                            controller.isConnecting.value = false;
                          });
                        },
                        child: Obx(
                          () => Container(
                            width: 175,
                            height: 175,
                            decoration: BoxDecoration(
                              color: controller.isConnected.value
                                  ? const Color(0xff1D5BFA)
                                  : controller.isConnecting.value
                                      ? const Color.fromARGB(255, 16, 7, 150)
                                      : const Color(0xff011A39),
                              borderRadius: BorderRadius.circular(175),
                              border: Border.all(
                                color: controller.isConnected.value
                                    ? const Color.fromARGB(255, 8, 59, 189)
                                    : controller.isConnecting.value
                                        ? const Color.fromARGB(255, 15, 7, 132)
                                        : const Color(0xff1D5BFA),
                                width: 15,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: controller.isConnecting.value
                                      ? const Color.fromARGB(255, 23, 12, 181)
                                      : const Color.fromARGB(196, 29, 92, 250),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => controller.isConnected.value
                                      ? const Icon(
                                          Icons.done,
                                          size: 60,
                                          color: Colors.white,
                                        )
                                      : controller.isConnecting.value
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.power_settings_new_rounded,
                                              size: 60,
                                              color: Colors.white,
                                            ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => controller.isConnected.value
                            ? InkWell(
                                onTap: () {
                                  controller.isConnected.value = false;
                                  controller.getLocalIPAddress();
                                },
                                child: const Text(
                                  "Disconnect",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : controller.isConnecting.value
                                ? const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Connecting...",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    "Tap to connect",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Text(
                        "Select location",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const CountryScreen(),
                              transition: Transition.noTransition);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff1D5BFA),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 13,
                              bottom: 13,
                              right: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/singapore-flag-png-large.png"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Singapore",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1D5BFA),
                          fixedSize: Size(Get.width, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          Get.to(const PremiumScreen(),
                              transition: Transition.noTransition);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset("assets/images/king.png"),
                            ),
                            const Text(
                              "GET PREMIUM",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
