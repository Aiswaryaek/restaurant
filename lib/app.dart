import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/home/home_page.dart';



class FlutterBasicApp extends StatefulWidget {
  const FlutterBasicApp({super.key});

  @override
  State<FlutterBasicApp> createState() => _FlutterBasicAppState();
}

class _FlutterBasicAppState extends State<FlutterBasicApp> {
  @override
  Widget build(BuildContext context) {
    return const AdminHomePage();

  }
}
