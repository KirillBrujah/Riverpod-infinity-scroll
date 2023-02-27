import 'package:flutter/material.dart';
import 'package:riverpod_infinity_scroll_list/ui/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod infinity scroll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
