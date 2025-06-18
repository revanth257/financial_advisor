import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;

  // Controllers for Step 1: Personal Details
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Controllers for Step 2: License Details
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController issuingAuthorityController = TextEditingController();
  final TextEditingController yearsExperienceController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();

  // Fixed password for all users
  final String fixedPassword = 'FIN0891#';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register as Financial Advisor'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep == 0) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // Save data using Provider
              Provider.of<UserModel>(context, listen: false).updateUser(
                name: nameController.text,
                email: emailController.text,
                phone: phoneController.text,
                licenseNumber: licenseNumberController.text,
                issuingAuthority: issuingAuthorityController.text,
                yearsExperience: yearsExperienceController.text,
                specialization: specializationController.text,
                certification: certificationController.text,
                password: fixedPassword,
              );
              // Show success dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text(
                    'Registration Successful!',
                    style: TextStyle(
                      color: Color(0xFF1A237E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your account has been created. Please use the following password to log in:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Password: $fixedPassword',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A237E),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Note: Save this password securely.',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Go to Login',
                        style: TextStyle(
                          color: Color(0xFF1A237E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentStep > 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Color(0xFF1A237E), fontSize: 16),
                      ),
                    ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: _currentStep == 0 ? 'Continue' : 'Register',
                    onPressed: details.onStepContinue!,
                  ),
                ],
              ),
            );
          },
          steps: [
            Step(
              title: const Text('Personal Details'),
              content: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    label: 'Full Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    label: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: phoneController,
                    label: 'Phone Number',
                    icon: Icons.phone,
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('License Details'),
              content: Column(
                children: [
                  CustomTextField(
                    controller: licenseNumberController,
                    label: 'License Number',
                    icon: Icons.card_membership,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: issuingAuthorityController,
                    label: 'Issuing Authority',
                    icon: Icons.account_balance,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: yearsExperienceController,
                    label: 'Years of Experience',
                    icon: Icons.work_history,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: specializationController,
                    label: 'Specialization (e.g., Wealth Management)',
                    icon: Icons.star,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: certificationController,
                    label: 'Certifications (e.g., CFP, CFA)',
                    icon: Icons.verified,
                  ),
                ],
              ),
              isActive: _currentStep >= 1,
              state: _currentStep == 1 ? StepState.indexed : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    licenseNumberController.dispose();
    issuingAuthorityController.dispose();
    yearsExperienceController.dispose();
    specializationController.dispose();
    certificationController.dispose();
    super.dispose();
  }
}