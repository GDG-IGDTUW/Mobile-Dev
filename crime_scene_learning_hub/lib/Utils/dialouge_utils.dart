import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future<bool?> showConfirmDialogue(BuildContext context, String title) async {
  bool? result;

  await QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    title: 'Confirm',
    text: title,
    confirmBtnText: 'Start',
    cancelBtnText: 'Cancel',
    confirmBtnColor: const Color.fromARGB(255, 216, 79, 37),
    onConfirmBtnTap: () {
      result = true;
      Navigator.pop(context);
    },
    onCancelBtnTap: () {
      result = false;
      Navigator.pop(context);
    },
  );

  return result;
}


