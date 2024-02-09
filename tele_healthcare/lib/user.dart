class UserData{
  late final String? name;
  final String? userType;
  final String? email;
  final String? password;
  final String? empId;
  final String? accExpiryDate;
  final String? accStatue;

  UserData({ required this.name,
    required this.userType,
    required this.email,
    required this.password,
    required this.empId,
    required this.accExpiryDate,
    required this.accStatue,});

  static const List<String> userTypeList = <String>[
    "",
    "Nurse",
    "Doctor/Physician",
    "Lab Assistant",
    "Pharmacist",
    "Admin",
  ];

}