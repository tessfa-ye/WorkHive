import 'package:flutter/material.dart';
import 'package:workhive/features/auth/presentation/screens/register_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/navigation/main_navigation_wrapper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Default role is 'freelancer'
  String selectedRole = 'freelancer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ),
              Center(
                child: const Text(
                  "Login to continue your journey",
                  style: TextStyle(fontSize: 16, color: AppColors.textGrey),
                ),
              ),
              const SizedBox(height: 32),

              // --- ROLE SELECTION TOGGLE ---
              Center(
                child: const Text(
                  "Join as a...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Center(
                child: const Text(
                  "How do you want to use WorkHive?",
                  style: TextStyle(fontSize: 16, color: AppColors.textGrey),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _roleButton(
                    "Freelancer",
                    Icons.person_search_rounded,
                    'freelancer',
                  ),
                  const SizedBox(width: 12),
                  _roleButton(
                    "Client",
                    Icons.business_center_rounded,
                    'client',
                  ),
                ],
              ),

              // -----------------------------
              const SizedBox(height: 50),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  // Navigate directly to the Main Wrapper with the selected role
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MainNavigationWrapper(userRole: selectedRole),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: AppColors.primaryBlue,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 24),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom widget for the role selector buttons
  Widget _roleButton(String title, IconData icon, String role) {
    bool isSelected = selectedRole == role;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedRole = role),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryBlue.withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primaryBlue : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? AppColors.primaryBlue : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
