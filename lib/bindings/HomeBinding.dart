import 'package:get/get.dart';
import 'package:mile_log/pages/HomePageController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // 이 컨트롤러는 화면이 사라지면 자동 제거됨
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}