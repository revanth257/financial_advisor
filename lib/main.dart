import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';
import 'models/client_model.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
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
      title: 'Financial Advisor App',
      theme: ThemeData(
        primaryColor: const Color(0xFF1A237E),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}