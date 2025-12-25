import 'package:flutter/material.dart';
import 'package:workhive/features/marketplace/presentation/widgets/send_offer_modal.dart';
import '../../../../core/theme/app_colors.dart';

class FreelancerProfileView extends StatelessWidget {
  final String name;
  final String role;

  const FreelancerProfileView({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Animated Header
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryBlue, Color(0xFF64B5F6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=11",
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      role,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat("4.9", "Rating"),
                      _buildStat("98%", "Job Success"),
                      _buildStat("124", "Jobs Done"),
                    ],
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Expert Flutter developer with 5+ years of experience building scalable mobile applications. Specialized in UI/UX and Firebase integration.",
                    style: TextStyle(color: AppColors.textGrey, height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    "Skills",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children:
                        [
                          "Flutter",
                          "Dart",
                          "Firebase",
                          "Git",
                          "REST API",
                          "UI Design",
                        ].map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor: AppColors.background,
                            side: BorderSide.none,
                            labelStyle: const TextStyle(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    "Portfolio",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: 4,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/200/200"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => SendOfferModal(freelancerName: name),
            );
          },
          child: const Text("Send Offer"),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
        ),
      ],
    );
  }
}
