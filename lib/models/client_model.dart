import 'package:flutter/foundation.dart';

class ClientModel {
  final String id;
  // Personal Information
  String fullName;
  String dateOfBirth;
  String taxFileNumber;
  String emailAddress;
  String phoneNumber;
  String residentialAddress;
  String employmentStatus;
  String maritalStatus;
  int numberOfDependents;
  // Goals Information
  String shortTermGoals;
  String mediumTermGoals;
  String longTermGoals;
  String whyGoalImportant;
  // Risk Profile (Simplified)
  String investmentExperience;
  String riskTolerance;
  String preferredInvestmentType;
  // Additional Needs
  bool needsMortgageBroking;
  bool needsLifeInsurance;
  bool needsEstatePlanning;

  ClientModel({
    required this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.taxFileNumber,
    required this.emailAddress,
    required this.phoneNumber,
    required this.residentialAddress,
    required this.employmentStatus,
    required this.maritalStatus,
    required this.numberOfDependents,
    this.shortTermGoals = '',
    this.mediumTermGoals = '',
    this.longTermGoals = '',
    this.whyGoalImportant = '',
    this.investmentExperience = '',
    this.riskTolerance = '',
    this.preferredInvestmentType = '',
    this.needsMortgageBroking = false,
    this.needsLifeInsurance = false,
    this.needsEstatePlanning = false,
  });

  // Copy method for updating
  ClientModel copyWith({
    String? fullName,
    String? dateOfBirth,
    String? taxFileNumber,
    String? emailAddress,
    String? phoneNumber,
    String? residentialAddress,
    String? employmentStatus,
    String? maritalStatus,
    int? numberOfDependents,
    String? shortTermGoals,
    String? mediumTermGoals,
    String? longTermGoals,
    String? whyGoalImportant,
    String? investmentExperience,
    String? riskTolerance,
    String? preferredInvestmentType,
    bool? needsMortgageBroking,
    bool? needsLifeInsurance,
    bool? needsEstatePlanning,
  }) {
    return ClientModel(
      id: id,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      taxFileNumber: taxFileNumber ?? this.taxFileNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      residentialAddress: residentialAddress ?? this.residentialAddress,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfDependents: numberOfDependents ?? this.numberOfDependents,
      shortTermGoals: shortTermGoals ?? this.shortTermGoals,
      mediumTermGoals: mediumTermGoals ?? this.mediumTermGoals,
      longTermGoals: longTermGoals ?? this.longTermGoals,
      whyGoalImportant: whyGoalImportant ?? this.whyGoalImportant,
      investmentExperience: investmentExperience ?? this.investmentExperience,
      riskTolerance: riskTolerance ?? this.riskTolerance,
      preferredInvestmentType: preferredInvestmentType ?? this.preferredInvestmentType,
      needsMortgageBroking: needsMortgageBroking ?? this.needsMortgageBroking,
      needsLifeInsurance: needsLifeInsurance ?? this.needsLifeInsurance,
      needsEstatePlanning: needsEstatePlanning ?? this.needsEstatePlanning,
    );
  }
}

// Mock provider for client data
class ClientProvider extends ChangeNotifier {
  List<ClientModel> _clients = [
    ClientModel(
      id: '1',
      fullName: 'John Doe',
      dateOfBirth: '1985-06-15',
      taxFileNumber: '123456789',
      emailAddress: 'john.doe@example.com',
      phoneNumber: '+61 400 123 456',
      residentialAddress: '123 Main St, Sydney NSW 2000',
      employmentStatus: 'Full-time',
      maritalStatus: 'Married',
      numberOfDependents: 2,
      shortTermGoals: 'Save for a vacation',
      mediumTermGoals: 'Purchase a car',
      longTermGoals: 'Retirement planning',
      whyGoalImportant: 'To secure a comfortable future for my family',
      investmentExperience: 'Moderate',
      riskTolerance: 'Balanced',
      preferredInvestmentType: 'Balanced Portfolio',
      needsMortgageBroking: true,
      needsLifeInsurance: false,
      needsEstatePlanning: true,
    ),
    ClientModel(
      id: '2',
      fullName: 'Jane Smith',
      dateOfBirth: '1990-03-22',
      taxFileNumber: '987654321',
      emailAddress: 'jane.smith@example.com',
      phoneNumber: '+61 411 987 654',
      residentialAddress: '456 Elm St, Melbourne VIC 3000',
      employmentStatus: 'Part-time',
      maritalStatus: 'Single',
      numberOfDependents: 0,
      shortTermGoals: 'Build emergency fund',
      longTermGoals: 'Buy a house',
      whyGoalImportant: 'Financial independence',
      investmentExperience: 'Low',
      riskTolerance: 'Conservative',
      preferredInvestmentType: 'Fixed Income',
      needsMortgageBroking: false,
      needsLifeInsurance: true,
      needsEstatePlanning: false,
    ),
  ];

  List<ClientModel> get clients => _clients;

  void addClient(ClientModel client) {
    _clients.add(client);
    notifyListeners();
  }

  void updateClient(String id, ClientModel updatedClient) {
    final index = _clients.indexWhere((client) => client.id == id);
    if (index != -1) {
      _clients[index] = updatedClient;
      notifyListeners();
    }
  }
}