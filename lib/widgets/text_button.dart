import 'package:eng_project/constant/app_constant.dart';
import 'package:flutter/material.dart';

Widget appTextButton({required void Function() ontap, required String text}) {
  return TextButton(
    style: TextButton.styleFrom(
      side: BorderSide(color: AppConstant.red, width: 2),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
    ),
    onPressed: ontap,
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Text(text,
          style: TextStyle(
              color: AppConstant.red,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
    ),
  );
}
