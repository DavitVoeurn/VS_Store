import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs_store/auth/view/otp/otp_vm.dart';
import 'package:vs_store/auth/view/sign_up/sign_up_vm.dart';
import 'package:vs_store/get_init.dart';
import 'package:vs_store/auth/view/account/welcome_screen.dart';

import 'auth/view/create password/register_request_vm.dart';

void main() {
  GetInit.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpVm()),
        ChangeNotifierProvider(create: (_) => OtpVm()),
        ChangeNotifierProvider(create: (_) => CreatePasswordVm()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VS Store',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: WelcomeScreen(),
    );
  }
}
