import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mile_log/pages/BasePage.dart';
import 'package:mile_log/pages/SubPageController.dart';

class SubPage extends BasePage<SubPageController>{

  SubPage({
    super.key,
    super.bHideBottomNavi,
    super.bHideTopBar = false,
    super.sTitle = "SubPage",
    super.bAllowBackNavigate = true,
  })
      : super(

  );

  @override
  SubPageController get controller => Get.find<SubPageController>();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("SubPage"));
  }


}