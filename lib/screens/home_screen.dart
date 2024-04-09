import'dart:math' as math;

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
         title: Row(
          children: [
            const SizedBox(width: 8,),
            Transform.rotate(
              angle: math.pi / 9.9999,
              child: Image.asset('assets/images/splash.png',
              height: 80,
              width: 60,
              ),
            ),
            const SizedBox(width: 8,),
            const Text('| AMS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.normal,
             ),
            ),
          ],
         ),
      ),
      body: SafeArea(
        child: Container(
          child: const Column(
            children: [
               SizedBox(height: 10,)
            ],
           ),
          ),
        ),
    );
  }
}

