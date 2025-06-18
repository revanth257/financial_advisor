import 'dart:async';
import 'package:flutter/material.dart';
import 'carousel_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CarouselScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_balance,
              size: 120,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'Financial Advisor',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Empowering Your Financial Future',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}