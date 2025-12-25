import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login(String email, String password) async {
    // For now, we simulate a network delay and return a mock user
    await Future.delayed(const Duration(seconds: 2));
    return UserEntity(
      id: '123',
      email: email,
      fullName: 'tess w',
      role: 'FREELANCER',
    );
  }

  @override
  Future<void> logout() async {
    // Logic to clear tokens
  }
}