import 'package:get/get.dart';
import 'package:mile_log/bindings/HomeBinding.dart';
import 'package:mile_log/bindings/SubPageBinding.dart';
import 'package:mile_log/pages/HomePage.dart';
import 'package:mile_log/pages/MainPage.dart';
import 'package:mile_log/pages/SubPage.dart';

import 'Routes.dart';

final List<GetPage> appPages = [
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.subPage,
    page: () => SubPage(),
    binding: SubPageBinding()
  )
];