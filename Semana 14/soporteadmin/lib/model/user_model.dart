class UserModel {
  final String id;
  final String? email;
  final String? fullName;
  final DateTime? createdAt;
  final String? role;

  UserModel({
    required this.id,
    this.email,
    this.fullName,
    this.createdAt,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'],
      fullName: json['full_name'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'created_at': createdAt?.toIso8601String(),
      'role': role,
    };
  }
}
