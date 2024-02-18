import 'package:get/get.dart';
import 'dart:io';

class ServerController extends GetxController {
  RxBool isConnecting = false.obs;
  RxBool isConnected = false.obs;
  RxBool isNotConnected = true.obs;
  RxString localip = "".obs;

  Future<void> getLocalIPAddress() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var address in interface.addresses) {
          if (address.type == InternetAddressType.IPv4) {
            localip.value = address.address;
            print('Local IP Address: ${address.address}');
            return; // Stop the loop once the first IPv4 address is found
          }
        }
      }
      print('No local IPv4 address found.');
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> getLocalIPAddress() async {
  //   final connectivityResult = await Connectivity().checkConnectivity();

  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     try {
  //       final host = await InternetAddress.lookup('google.com');
  //       if (host.isNotEmpty && host.first.rawAddress.isNotEmpty) {
  //         final localIP = host.first.rawAddress;
  //         print(
  //             'Local IP Address: ${localIP.map((byte) => byte.toString()).join('.')}');
  //       } else {
  //         print('Failed to get local IP address.');
  //       }
  //     } catch (e) {
  //       print('Error: $e');
  //     }
  //   } else {
  //     print('No internet connection available.');
  //   }
  // }
}
