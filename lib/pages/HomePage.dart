import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mile_log/pages/BasePage.dart';
import 'package:mile_log/pages/HomePageController.dart';

class HomePage extends BasePage<HomePageController> {
  const HomePage({super.key});

  @override
  HomePageController get controller => Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Text("hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}