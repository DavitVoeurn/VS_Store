import 'package:flutter/material.dart';
import 'package:vs_store/home/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VS Store',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginScreen(),
    );
  }
}
