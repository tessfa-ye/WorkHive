import 'package:flutter/material.dart';
import 'package:workhive/features/job_management/presentation/screens/post_job_screen.dart';
import 'package:workhive/features/marketplace/presentation/screens/review_proposals_screen.dart';
import '../../../../core/theme/app_colors.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Client Dashboard",
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textMain,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Row
            Row(
              children: [
                _buildStatCard("Active Jobs", "3", AppColors.primaryBlue),
                const SizedBox(width: 16),
                _buildStatCard("Total Spent", "\$2.4k", AppColors.accentAmber),
              ],
            ),
            const SizedBox(height: 32),

            // Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your Postings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            const SizedBox(height: 12),

            // Job List
            _buildJobPostCard(
              context: context,
              title: "Flutter E-commerce App",
              proposals: 12,
              status: "Active",
              budget: "\$1,200",
            ),
            _buildJobPostCard(
              context: context,
              title: "UI/UX Design for SaaS",
              proposals: 8,
              status: "Pending",
              budget: "\$800",
            ),
            _buildJobPostCard(
              context: context,
              title: "Backend API Integration",
              proposals: 5,
              status: "Active",
              budget: "\$1,500",
            ),
          ],
        ),
      ),
      // Floating Action Button to Post a Job
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostJobScreen()),
        ),
        backgroundColor: AppColors.primaryBlue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Post a Job",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2), width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobPostCard({
    required BuildContext context,
    required String title,
    required int proposals,
    required String status,
    required String budget,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                  color: status == "Active" ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                budget,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.people_outline,
                size: 18,
                color: AppColors.textGrey,
              ),
              const SizedBox(width: 8),
              Text(
                "$proposals Proposals",
                style: const TextStyle(color: AppColors.textGrey),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReviewProposalsScreen(jobTitle: title),
                    ),
                  );
                },
                child: Row(
                  children: const [
                     Text(
                      "Review",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
