class UserEntity {
  final String id;
  final String email;
  final String fullName;
  final String role; // 'CLIENT' or 'FREELANCER'

  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
  });
}