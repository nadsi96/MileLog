import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 화면 기본 페이지 뷰
// 백/포 그라운드 전환 등 공통 처리 작성
abstract class BasePage<T extends GetxController> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  T get controller;

  // Widget buildBody(BuildContext context);
  Widget build(BuildContext context);

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
    return widget.build(context);
  }
}
