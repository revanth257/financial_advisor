import 'package:flutter/material.dart';
import '../models/client_model.dart';
import '../widgets/custom_button.dart';

class ClientDetailsScreen extends StatelessWidget {
  final ClientModel client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(client.fullName),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information
            _buildSection(
              title: 'Personal Information',
              children: [
                _buildDetailRow(Icons.person, 'Full Name', client.fullName),
                _buildDetailRow(Icons.cake, 'Date of Birth', client.dateOfBirth),
                _buildDetailRow(Icons.fingerprint, 'Tax File Number', client.taxFileNumber),
                _buildDetailRow(Icons.email, 'Email Address', client.emailAddress),
                _buildDetailRow(Icons.phone, 'Phone Number', client.phoneNumber),
                _buildDetailRow(Icons.home, 'Residential Address', client.residentialAddress),
                _buildDetailRow(Icons.work, 'Employment Status', client.employmentStatus),
                _buildDetailRow(Icons.favorite, 'Marital Status', client.maritalStatus),
                _buildDetailRow(Icons.group, 'Number of Dependents', client.numberOfDependents.toString()),
              ],
            ),
            const SizedBox(height: 16),
            // Goals Information
            _buildSection(
              title: 'Goals Information',
              children: [
                _buildDetailRow(Icons.timer, 'Short-term Goals', client.shortTermGoals.isEmpty ? 'Not Set' : client.shortTermGoals),
                _buildDetailRow(Icons.hourglass_empty, 'Medium-term Goals', client.mediumTermGoals.isEmpty ? 'Not Set' : client.mediumTermGoals),
                _buildDetailRow(Icons.trending_up, 'Long-term Goals', client.longTermGoals.isEmpty ? 'Not Set' : client.longTermGoals),
                _buildDetailRow(Icons.sentiment_satisfied, 'Why Goal is Important', client.whyGoalImportant.isEmpty ? 'Not Set' : client.whyGoalImportant),
              ],
            ),
            const SizedBox(height: 16),
            // Risk Profile
            _buildSection(
              title: 'Risk Profile',
              children: [
                _buildDetailRow(Icons.history, 'Investment Experience', client.investmentExperience.isEmpty ? 'Not Set' : client.investmentExperience),
                _buildDetailRow(Icons.warning, 'Risk Tolerance', client.riskTolerance.isEmpty ? 'Not Set' : client.riskTolerance),
                _buildDetailRow(Icons.pie_chart, 'Preferred Investment Type', client.preferredInvestmentType.isEmpty ? 'Not Set' : client.preferredInvestmentType),
              ],
            ),
            const SizedBox(height: 16),
            // Additional Needs
            _buildSection(
              title: 'Additional Needs',
              children: [
                _buildDetailRow(Icons.account_balance, 'Mortgage Broking', client.needsMortgageBroking ? 'Yes' : 'No'),
                _buildDetailRow(Icons.security, 'Life Insurance', client.needsLifeInsurance ? 'Yes' : 'No'),
                _buildDetailRow(Icons.account_balance_wallet, 'Estate Planning', client.needsEstatePlanning ? 'Yes' : 'No'),
              ],
            ),
            const SizedBox(height: 24),
            // Action Buttons
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

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E),
          ),
        ),
        iconColor: const Color(0xFF1A237E),
        childrenPadding: const EdgeInsets.all(16.0),
        children: children,
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF1A237E)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}