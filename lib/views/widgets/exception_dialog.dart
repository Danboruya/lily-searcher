import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/providers/core_providers.dart';

Widget exceptionDialog(BuildContext context, Function? func) {
  return AlertDialog(
    title: Text(context.read(businessExceptionProvider).title),
    content: Text(context.read(businessExceptionProvider).message),
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
