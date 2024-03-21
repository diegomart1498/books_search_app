import 'dart:io';
import 'package:books_search_app/src/configs/routing_config/package.dart';
import 'package:books_search_app/src/configs/utilities/package.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = HttpExceptionOverride();
  runApp(const MyApp());
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
