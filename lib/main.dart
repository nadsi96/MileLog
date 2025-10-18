import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mile_log/managers/NetworkManager.dart';
import 'package:mile_log/routes/Routes.dart';
import 'package:mile_log/routes/pages.dart';

void main() {

  Get.put(NetworkManager(), permanent: true);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    final networkManager = Get.find<NetworkManager>();

    // 네트워크 상태 감시
    // 네트워크 연결 상태 변화에 따라 스낵바 노출
    ever(networkManager.isConnected, (connected) {
      print("isConnected: $connected");
      Get.closeCurrentSnackbar();
      if (!connected) {
        Get.snackbar(
          "네트워크 없음",
          "인터넷 연결이 끊겼습니다.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(days: 1),
        );
      } else {
        Get.snackbar(
          "네트워크 복구",
          "인터넷 연결이 복구되었습니다.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    });

    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: appPages,
      debugShowCheckedModeBanner: false,
    );
  }
}