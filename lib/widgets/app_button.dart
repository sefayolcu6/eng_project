import 'package:eng_project/constant/app_constant.dart';
import 'package:eng_project/constant/extensions.dart';
import 'package:flutter/material.dart';

Widget appButton({
  required BuildContext context,
  required VoidCallback ontap,
  required String text,
}) {
  return Padding(
    padding: EdgeInsets.all(AppConstant.padding2),
    child: SizedBox(
      width: context.screenWidth25(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppConstant.darkBlue),
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(fontSize: 17, color: AppConstant.white),
        ),
      ),
    ),
  );
}
