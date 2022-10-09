
import 'package:e_commerce_app/view/base_scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

void main() {
  // riverpod'u kullanak için ProviderScope kullanıyoruz
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const BaseScaffold()
    );
  }
}
