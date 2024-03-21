import 'dart:async';
import 'dart:io';
import 'package:books_search_app/src/configs/routing_config/package.dart';
import 'package:books_search_app/src/configs/utilities/package.dart';
import 'package:books_search_app/src/feature/login/package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/feature/home/package.dart';

Future<void> main() async {
  HttpOverrides.global = HttpExceptionOverride();
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BooksProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => LoginProvider(prefs), lazy: false),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[600]!),
        useMaterial3: true,
      ),
      routerConfig: appRouter(),
    );
  }
}
