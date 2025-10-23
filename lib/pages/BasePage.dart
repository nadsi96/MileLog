import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mile_log/dialogs/ExitDialog.dart';
import 'package:mile_log/routes/Routes.dart';

// 화면 기본 페이지 뷰
// 백/포 그라운드 전환 등 공통 처리 작성
abstract class BasePage<T extends GetxController> extends StatefulWidget {
  // =============================================
  // 상단바 공통 처리
  bool bHideTopBar; // 상단바 숨김 여부
  bool bAllowBackNavigate; // 안드로이드 뒤로가기 동작 허용 여부
  // false인 경우, 상단 뒤로가기 버튼도 숨김

  Function()? onAppBarLeadingPressed; // 상단바 좌상단 버튼 클릭 동작
  Widget? leadingBtnIcon; // 상단바 좌상단 버튼 위젯

  String sTitle; // 화면 타이틀

  // =============================================

  bool bHideBottomNavi; // 하단 네비바 숨김 여부

  BasePage({
    Key? key,
    this.sTitle = "",
    this.bHideTopBar = false,
    this.bAllowBackNavigate = true,
    this.onAppBarLeadingPressed,
    this.leadingBtnIcon,
    this.bHideBottomNavi = false,
  }) : super(key: key) {}

  T get controller;

  // Widget buildBody(BuildContext context);
  Widget build(BuildContext context);

  /// 앱 상단바 좌측 버튼
  /// 디폴트 뒤로가기 버튼
  ///
  /// bAllowBackNavigate가 true이면 노출
  /// false면 노출하지 않음
  Widget? topAppBarLeading() {
    return this.bAllowBackNavigate
        ? IconButton(
            onPressed:
                this.onAppBarLeadingPressed ??
                () {
                  // 기본 뒤로가기 동작
                  Get.back();
                },
            icon: this.leadingBtnIcon ?? Icon(Icons.arrow_back_ios_new),
          )
        : null;
  }

  /// 앱 상단바
  PreferredSizeWidget topAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: topAppBarLeading(),
      title: sTitle.isNotEmpty ? Text(this.sTitle) : null,
      centerTitle: true,
    );
  }

  /// 하단 네비바 버튼 생성
  /// 현재 Route가 targetRoute와 동일하면 색상 변경
  /// 탭 시 targetRoute로 이동
  /// home인 경우, 이전 스택 삭제 후 이동
  Widget bottomNaviButton(String targetRoute) {
    var iconSet = {
      Routes.home: Icons.home_filled,
      Routes.subPage: Icons.insert_drive_file_rounded,
    };
    return InkWell(
      onTap: () {
        if (Get.currentRoute != targetRoute) {
          if (targetRoute == Routes.home) {
            Get.offAllNamed(targetRoute);
          } else {
            Get.toNamed(targetRoute);
          }
        }
      },
      child: Center(
        child: Icon(
          iconSet[targetRoute] ?? Icons.close,
          color: Get.currentRoute == targetRoute
              ? Colors.blue
              : Colors.blueGrey,
        ),
      ),
    );
  }

  Widget? bottomNaviBar() {
    if (bHideBottomNavi) {
      return null;
    } else {
      return Container(
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(
            top: BorderSide(color: Colors.black87, width: 1),
          ),
        ),
        height: 48,
        width: double.infinity,
        child: Row(
          spacing: 4,
          children: [
            Expanded(child: bottomNaviButton(Routes.home)),
            Expanded(child: bottomNaviButton(Routes.subPage)),
          ],
        ),
      );
    }
  }

  @override
  State<BasePage<T>> createState() => _BasePageState<T>();
}

class _BasePageState<T extends GetxController> extends State<BasePage<T>>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱 상태 처리
    if (state == AppLifecycleState.resumed) {
      // 앱이 포그라운드로 복귀했을 때
    } else if (state == AppLifecycleState.paused) {
      // 앱이 백그라운드로 이동했을 때
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // widget.bAllowBackNavigate,
      onPopInvokedWithResult: (didPop, result) async {
        final current = Get.currentRoute;
        // final previous = Get.previousRoute; // 화면 스택이 아닌 이전 화면의 route를 문자열로 저장할 뿐
        // 이 값으로 스택이 더 없다는것을 확인할 수 없음

        if (Get.key.currentState?.canPop() ?? false) {
          if (widget.bAllowBackNavigate) {
            // 스택에 이전 화면이 있다면 그냥 뒤로가기
            Get.back();
          }
        } else {
          // 이전 화면이 없음
          // 현재 화면이 홈 화면인지 확인
          if (current == Routes.home) {
            // 홈화면이면 종료 확인 다이얼로그 노출
            Get.dialog(
              ExitDialog(),
              barrierDismissible: true, // 딤 영역 클릭 시 다이얼로그 닫기 여부
            );
          } else {
            // 홈이 아니라면 홈으로 이동
            Get.offAllNamed(Routes.home);
          }
        }
      },
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          appBar: widget.bHideTopBar ? null : widget.topAppBar(),
          body: widget.build(context),
          bottomNavigationBar: widget.bottomNaviBar(),
        ),
      ),
    );
    return widget.build(context);
  }
}
