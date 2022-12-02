import 'package:flutter/material.dart';
import 'package:post_api_k/provider/classes_screen.dart';
import 'package:post_api_k/provider/app_satte.dart';
import 'package:provider/provider.dart';

import 'home-screen.dart';
import 'my_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => loginPro(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
