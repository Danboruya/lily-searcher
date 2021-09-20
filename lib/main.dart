import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lily_searcher/views/search_list_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: SearchListView(),
    ),
  );
}
