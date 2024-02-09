import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controller/CalculatorModel.dart';
import 'package:test1/pages/home.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'testApp',
      theme: ThemeData(
        // use Material 3
        useMaterial3: true,
      ),
      home: const HomePage(), 
      // routes: {
      //   '/profile': (context) => const ProfilePage(),
      //   '/calculator': (context) => const CalculatorScreen(), 
      // },
    );
  }
}
