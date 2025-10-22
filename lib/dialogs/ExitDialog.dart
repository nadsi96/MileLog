import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// 종료 확인 다이얼로그
class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("종료하시겠습니까?"),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: false); // 다이얼로그만 닫기
                  },
                  child: Text("취소"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                    // SystemNavigator.pop();
                  },
                  child: Text("종료"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
