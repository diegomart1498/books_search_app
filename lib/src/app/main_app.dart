import 'package:flutter/material.dart';
import '../configs/routing_config/package.dart';

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
