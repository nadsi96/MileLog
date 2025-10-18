import 'package:get/get.dart';
import 'package:mile_log/bindings/HomeBinding.dart';
import 'package:mile_log/pages/HomePage.dart';
import 'package:mile_log/pages/MainPage.dart';

import 'Routes.dart';

final List<GetPage> appPages = [
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
];