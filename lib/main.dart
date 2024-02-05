import 'dart:async';

import 'package:apple_gadgets_task/const/di/app_component.dart';
import 'package:apple_gadgets_task/const/route/router.dart';
import 'package:apple_gadgets_task/const/session/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Gedgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.onRouteGenerate,
    );
  }
}
