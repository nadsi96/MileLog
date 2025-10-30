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


  Widget testPageBtn(String sText, String sTargetRoute){
    return InkWell(
      onTap: (){
        Get.toNamed(sTargetRoute);
      },
      child: Text(sText),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          testPageBtn("SubPage", Routes.subPage),
          testPageBtn("NaverMap", Routes.naverMapPage)
        ]
      ),
    );
  }
}