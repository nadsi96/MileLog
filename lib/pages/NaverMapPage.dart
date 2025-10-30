import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:mile_log/pages/BasePage.dart';
import 'package:mile_log/pages/NaverMapPageController.dart';

class NaverMapPage extends BasePage<NaverMapPageController> {
  NaverMapPage({
    super.key,
    super.bHideBottomNavi,
    super.bHideTopBar = false,
    super.sTitle = "NaverMap",
    super.bAllowBackNavigate = true,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: const NaverMapViewOptions(
        indoorEnable: true,             // 실내 맵 사용 가능 여부 설정
        // locationButtonEnable: false,    // 위치 버튼 표시 여부 설정
        // consumeSymbolTapEvents: false,  // 심볼 탭 이벤트 소비 여부 설정
      ),
      onMapReady: (controller) async { // 지도 준비 완료 시 호출되는 콜백 함수
        print("Naver Map Ready");
      },
    );
  }

  @override
  // TODO: implement controller
  NaverMapPageController get controller => Get.find<NaverMapPageController>();
}
