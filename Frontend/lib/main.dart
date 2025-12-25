import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workhive/features/auth/presentation/screens/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/providers/auth_provider.dart';

void main() {
  // 1. Initialize the Repository
  final authRepository = AuthRepositoryImpl();
  // 2. Initialize the Use Case
  final loginUseCase = LoginUseCase(authRepository);

  runApp(
    MultiProvider(
      providers: [
        // 3. Inject the Use Case into the Provider
        ChangeNotifierProvider(create: (_) => AuthProvider(loginUseCase: loginUseCase)),
      ],
      child: const WorkHiveApp(),
    ),
  );
}

class WorkHiveApp extends StatelessWidget {
  const WorkHiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}