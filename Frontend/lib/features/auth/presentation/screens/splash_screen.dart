import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _HighlightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Drawing a subtle background decoration
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  _navigateToNext() async {
    // Wait for 3 seconds to show the brand
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    // Navigate to Onboarding
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          CustomPaint(painter: _HighlightPainter(), child: Container()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace with your actual logo asset later
                const Icon(
                  Icons.hive_rounded,
                  size: 100,
                  color: AppColors.accentAmber,
                ),
                const SizedBox(height: 20),
                const Text(
                  "WorkHive",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Smart Work, Better Hive",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}