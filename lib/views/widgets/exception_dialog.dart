import 'package:flutter/material.dart';
import 'package:lily_searcher/utils/business_exception.dart';

Widget exceptionDialog(
    BuildContext context, BusinessException businessException, Function? func) {
  return AlertDialog(
    title: Text(businessException.title),
    content: Text(businessException.message),
    actions: [
      SimpleDialogOption(
        child: const Text('OK'),
        onPressed: () {
          func ?? Navigator.of(context).pop();
        },
      ),
    ],
  );
}
