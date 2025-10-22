import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mile_log/pages/BasePage.dart';
import 'package:mile_log/pages/HomePageController.dart';
import 'package:mile_log/routes/Routes.dart';

class HomePage extends BasePage<HomePageController> {
  HomePage({
    super.key,
    super.bHideBottomNavi,
    super.bHideTopBar = true,
    super.sTitle,
    super.bAllowBackNavigate = false,
  })
      : super(

  );

  @override
  HomePageController get controller => Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.subPage);
        },
        child: Text("hello"),
      ),
    );
  }
}