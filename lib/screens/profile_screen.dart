import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController licenseNumberController;
  late TextEditingController issuingAuthorityController;
  late TextEditingController yearsExperienceController;
  late TextEditingController specializationController;
  late TextEditingController certificationController;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserModel>(context, listen: false);
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    licenseNumberController = TextEditingController(text: user.licenseNumber);
    issuingAuthorityController = TextEditingController(text: user.issuingAuthority);
    yearsExperienceController = TextEditingController(text: user.yearsExperience);
    specializationController = TextEditingController(text: user.specialization);
    certificationController = TextEditingController(text: user.certification);
    debugPrint('ProfileScreen: Controllers initialized');
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

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      Provider.of<UserModel>(context, listen: false).updateUser(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        licenseNumber: licenseNumberController.text,
        issuingAuthority: issuingAuthorityController.text,
        yearsExperience: yearsExperienceController.text,
        specialization: specializationController.text,
        certification: certificationController.text,
      );
      setState(() {
        _isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Color(0xFF1A237E),
        ),
      );
      debugPrint('ProfileScreen: Profile saved');
    } else {
      debugPrint('ProfileScreen: Validation failed');
    }
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'Confirm Logout',
          style: TextStyle(
            color: Color(0xFF1A237E),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to log out?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFF1A237E),
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
              debugPrint('ProfileScreen: User logged out');
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advisor Profile'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name.isEmpty ? 'Financial Advisor' : user.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Personal Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _isEditing
                          ? CustomTextField(
                        controller: nameController,
                        label: 'Full Name',
                        icon: Icons.person,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.person, color: Color(0xFF1A237E)),
                        title: Text(user.name.isEmpty ? 'Not Set' : user.name),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: emailController,
                        label: 'Email',
                        icon: Icons.email,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.email, color: Color(0xFF1A237E)),
                        title: Text(user.email.isEmpty ? 'Not Set' : user.email),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: phoneController,
                        label: 'Phone Number',
                        icon: Icons.phone,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your phone number' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.phone, color: Color(0xFF1A237E)),
                        title: Text(user.phone.isEmpty ? 'Not Set' : user.phone),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // License Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Professional Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _isEditing
                          ? CustomTextField(
                        controller: licenseNumberController,
                        label: 'License Number',
                        icon: Icons.card_membership,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your license number' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.card_membership, color: Color(0xFF1A237E)),
                        title: Text(user.licenseNumber.isEmpty ? 'Not Set' : user.licenseNumber),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: issuingAuthorityController,
                        label: 'Issuing Authority',
                        icon: Icons.account_balance,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter the issuing authority' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.account_balance, color: Color(0xFF1A237E)),
                        title: Text(user.issuingAuthority.isEmpty ? 'Not Set' : user.issuingAuthority),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: yearsExperienceController,
                        label: 'Years of Experience',
                        icon: Icons.work_history,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter years of experience' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.work_history, color: Color(0xFF1A237E)),
                        title: Text(user.yearsExperience.isEmpty ? 'Not Set' : user.yearsExperience),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: specializationController,
                        label: 'Specialization',
                        icon: Icons.star,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your specialization' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.star, color: Color(0xFF1A237E)),
                        title: Text(user.specialization.isEmpty ? 'Not Set' : user.specialization),
                      ),
                      _isEditing
                          ? CustomTextField(
                        controller: certificationController,
                        label: 'Certifications',
                        icon: Icons.verified,
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your certifications' : null,
                      )
                          : ListTile(
                        leading: const Icon(Icons.verified, color: Color(0xFF1A237E)),
                        title: Text(user.certification.isEmpty ? 'Not Set' : user.certification),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    CustomButton(
                      text: _isEditing ? 'Save' : 'Edit Profile',
                      onPressed: () {
                        if (_isEditing) {
                          _saveProfile();
                        } else {
                          setState(() {
                            _isEditing = true;
                          });
                          debugPrint('ProfileScreen: Entered edit mode');
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Logout',
                      onPressed: _showLogoutConfirmation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}