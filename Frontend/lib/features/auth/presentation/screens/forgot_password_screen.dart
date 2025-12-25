import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              "Enter your email and we’ll send a reset code",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Send Reset Code"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
