import 'package:another_flushbar/flushbar.dart';
import 'package:eng_project/constant/app_constant.dart';
import 'package:flutter/material.dart';

Future infoFlushbar(BuildContext context, String title, String description) {
  return Flushbar(
    icon: Icon(
      Icons.info,
      color: AppConstant.black,
    ),
    margin: const EdgeInsets.all(6.0),
    borderRadius: BorderRadius.circular(12),
    backgroundGradient:
        const LinearGradient(colors: [Colors.orange, Colors.teal]),
    boxShadows: const [
      BoxShadow(
        color: Colors.orange,
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      )
    ],
    title: title,
    message: description,
    duration: const Duration(seconds: 4),
  ).show(context);
}
