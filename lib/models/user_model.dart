import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _licenseNumber = '';
  String _issuingAuthority = '';
  String _yearsExperience = '';
  String _specialization = '';
  String _certification = '';
  String _password = '';

  // Getters
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get licenseNumber => _licenseNumber;
  String get issuingAuthority => _issuingAuthority;
  String get yearsExperience => _yearsExperience;
  String get specialization => _specialization;
  String get certification => _certification;
  String get password => _password;

  // Update user data and notify listeners
  void updateUser({
    String? name,
    String? email,
    String? phone,
    String? licenseNumber,
    String? issuingAuthority,
    String? yearsExperience,
    String? specialization,
    String? certification,
    String? password,
  }) {
    _name = name ?? _name;
    _email = email ?? _email;
    _phone = phone ?? _phone;
    _licenseNumber = licenseNumber ?? _licenseNumber;
    _issuingAuthority = issuingAuthority ?? _issuingAuthority;
    _yearsExperience = yearsExperience ?? _yearsExperience;
    _specialization = specialization ?? _specialization;
    _certification = certification ?? _certification;
    _password = password ?? _password;
    notifyListeners();
  }

  @override
  String toString() {
    return 'UserModel(name: $_name, email: $_email, phone: $_phone, licenseNumber: $_licenseNumber, issuingAuthority: $_issuingAuthority, yearsExperience: $_yearsExperience, specialization: $_specialization, certification: $_certification, password: $_password)';
  }
}