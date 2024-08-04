import 'package:eng_project/constant/app_constant.dart';
import 'package:eng_project/widgets/text_button.dart';
import 'package:flutter/material.dart';

void appAlertDialog(
    {required BuildContext context,
    required title,
    required List<Widget> alertBody,
    required String buttonText,
    required void Function() buttonOntap}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: AppConstant.deepOrange),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: alertBody,
      ),
      actions: <Widget>[
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appTextButton(ontap: buttonOntap, text: buttonText),
            appTextButton(
                ontap: () {
                  Navigator.pop(context);
                },
                text: "Hayır"),
          ],
        )),
      ],
    ),
  );
}
