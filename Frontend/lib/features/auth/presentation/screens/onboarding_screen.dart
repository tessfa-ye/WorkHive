import 'package:flutter/material.dart';
import 'package:workhive/features/auth/presentation/screens/login_screen.dart';
import '../../../../core/theme/app_colors.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Updated to use the paths of the images you added
  final List<OnboardingContent> _pages = [
    OnboardingContent(
      title: "Find Top Talent, Fast",
      description: "Easily search and discover skilled freelancers for any project, right at your fingertips.",
      imagePath: "images/onboarding_1.png", 
    ),
    OnboardingContent(
      title: "Hire with Confidence",
      description: "Benefit from secure payments, clear contracts, and a trusted marketplace environment.",
      imagePath: "images/onboarding_2.png",
    ),
    OnboardingContent(
      title: "Collaborate Seamlessly",
      description: "Use built-in messaging, file sharing, and project management tools to get work done efficiently.",
      imagePath: "images/onboarding_3.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => _navigateToRoleSelection(),
            child: const Text("Skip", style: TextStyle(color: AppColors.textGrey)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) => _OnboardPage(content: _pages[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Dot Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? AppColors.primaryBlue : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Dynamic Button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      _navigateToRoleSelection();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_currentPage == _pages.length - 1 ? "Get Started" : "Next"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToRoleSelection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final OnboardingContent content;
  const _OnboardPage({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Replaced Icon with Image.asset
          SizedBox(
            height: 280, // Giving the image a fixed height for consistency
            child: Image.asset(
              content.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback in case the image path is wrong
                return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(height: 40),
          Text(
            content.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold, 
              color: AppColors.textMain,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16, 
              color: AppColors.textGrey, 
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final String imagePath; // Changed from IconData to String
  OnboardingContent({
    required this.title, 
    required this.description, 
    required this.imagePath,
  });
}