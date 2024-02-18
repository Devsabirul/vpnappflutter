import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:securevpnhub/views/screens/country_screen.dart';
import 'package:securevpnhub/views/screens/home_screen.dart';
import 'package:securevpnhub/views/screens/networktest_screen.dart';
import 'package:securevpnhub/views/screens/splash_screen.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            routes: {
              "/": (context) => const SplashScreen(),
              "/home": (context) => const HomeScreen(),
              "/server-country": (context) => const CountryScreen(),
              "/network-text": (context) => const NetWorkTestScreen(),
            },
          );
        });
  }
}
