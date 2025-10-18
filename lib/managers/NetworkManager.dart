import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

// 네트워크 상태 관리 컨트롤러
class NetworkManager extends GetxController {
  final isConnected = true.obs; // 네트워크 연결 상태
  late StreamSubscription _sub;

  @override
  void onInit() {
    super.onInit();

    // 네트워크 상태 구독
    // onConnectivityChanged로 상태 변화 감지
    _sub = Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = result.any((r) => r != ConnectivityResult.none);
      print("network state changed $result, ${ConnectivityResult.none}");
    });
  }

  @override
  void onClose() {
    _sub.cancel();
    super.onClose();
  }
}