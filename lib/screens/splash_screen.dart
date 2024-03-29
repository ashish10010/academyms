import 'dart:async';

import 'package:Academy/screens/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 3),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticOut);
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationtime) {
            return const Register();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/images/splash.png',
             height: 300,
             width: 300,
             fit: BoxFit.fill,
             ),
           const   SizedBox(height: 20,),
             const Text('AMS',
             style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
             ),
            ),
            const SizedBox(
              width: 150,
            child: LinearProgressIndicator(
              backgroundColor: Color.fromARGB(82, 158, 158, 158),
              minHeight: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
            ),
           ),
          ],
        ),
      ),
    );
  }
}