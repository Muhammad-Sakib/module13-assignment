import 'package:flutter/material.dart';
import 'package:module13_assignment/cart/presentation/check_out.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      home: const CheckOutScreen(),
    );
  }
}
