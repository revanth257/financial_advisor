import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Financial Question of the Day',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'What is the ideal debt-to-income ratio for long-term financial stability?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: 'AI Answer',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('AI-Generated Answer'),
                        content: const Text(
                          'The ideal debt-to-income ratio is typically 36%, with no more than 28% going toward housing costs.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                CustomButton(
                  text: 'Self Answer',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Your Answer'),
                        content: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter your answer',
                          ),
                          maxLines: 4,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}