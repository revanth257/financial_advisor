import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Financial Advisor',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'We are a leading financial advisory firm dedicated to helping individuals and businesses achieve their financial goals. Our team of certified financial advisors provides personalized advice on investments, retirement planning, tax strategies, and wealth management.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Our Mission',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'To empower our clients with the knowledge and tools they need to make informed financial decisions and secure their future.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Why Choose Us?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '- Expert Advisors\n- Tailored Solutions\n- Transparent Processes\n- Client-Centric Approach',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}