import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/navigation/main_navigation_wrapper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // Simulate account creation success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );
      
      // Navigate to the main app experience
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationWrapper(userRole: '',)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white, 
      //   elevation: 0, 
      //   iconTheme: const IconThemeData(color: AppColors.textMain)
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(child: const Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textMain))),
              const SizedBox(height: 8),
              Center(child: const Text("Join WorkHive and start collaborating", style: TextStyle(fontSize: 16, color: AppColors.textGrey))),
              const SizedBox(height:50),

              // Full Name Field
              _buildFieldLabel("Full Name"),
              TextFormField(
                controller: _nameController,
                decoration: _buildInputDecoration("John Doe", Icons.person_outline),
                validator: (value) => value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 20),

              // Email Field
              _buildFieldLabel("Email Address"),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _buildInputDecoration("example@mail.com", Icons.email_outlined),
                validator: (value) => value!.contains('@') ? null : "Enter a valid email",
              ),
              const SizedBox(height: 20),

              // Password Field
              _buildFieldLabel("Password"),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: _buildInputDecoration("••••••••", Icons.lock_outline).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
                validator: (value) => value!.length >= 6 ? null : "Password must be 6+ characters",
              ),
              const SizedBox(height: 32),

              // Register Button
              ElevatedButton(
                onPressed: _handleRegister,
                child: const Text("Create Account"),
              ),
              const SizedBox(height: 24),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Login", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: AppColors.background,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }
}