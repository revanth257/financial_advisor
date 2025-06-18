import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    const String fixedPassword = 'FIN0891#';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to your Financial Advisor account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  controller: usernameController,
                  label: 'Username',
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final user = Provider.of<UserModel>(context, listen: false);
                      print('Current user info: $user');
                      if ((usernameController.text == user.email || usernameController.text == 'revanthkishore1@gmail.com') && passwordController.text == fixedPassword) {
                        // Login success
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DashboardScreen()),
                        );
                      } else {
                        // Show error dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Login Error'),
                            content: const Text('Invalid username or password.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New to our platform? ',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}