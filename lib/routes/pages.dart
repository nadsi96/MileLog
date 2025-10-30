import 'package:get/get.dart';
import 'package:mile_log/bindings/HomeBinding.dart';
import 'package:mile_log/bindings/NaverMapPageBinding.dart';
import 'package:mile_log/bindings/SubPageBinding.dart';
import 'package:mile_log/pages/HomePage.dart';
import 'package:mile_log/pages/MainPage.dart';
import 'package:mile_log/pages/NaverMapPage.dart';
import 'package:mile_log/pages/SubPage.dart';

import 'Routes.dart';

final List<GetPage> appPages = [
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
    binding: HomeBinding(),
    transition: Transition.noTransition
  ),
  GetPage(
    name: Routes.subPage,
    page: () => SubPage(),
    binding: SubPageBinding(),
      transition: Transition.noTransition
  ),
  GetPage(
    name: Routes.naverMapPage,
    page: () => NaverMapPage(),
    binding: NaverMapPageBinding(),
    transition: Transition.noTransition
  )
];