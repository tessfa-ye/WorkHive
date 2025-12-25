import 'package:flutter/material.dart';
import 'package:workhive/features/marketplace/presentation/screens/apply_job_screen.dart';
import '../../../../core/theme/app_colors.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Job Details",
          style: TextStyle(color: AppColors.textMain),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textMain),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Job Title & Budget
            const Text(
              "Mobile App Developer (Flutter)",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoBadge(Icons.timer_outlined, "Posted 2h ago"),
                const SizedBox(width: 12),
                _buildInfoBadge(
                  Icons.monetization_on_outlined,
                  "\$40 - \$60 /hr",
                ),
              ],
            ),
            const Divider(height: 40),

            // Job Description
            const Text(
              "Job Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "We are looking for an experienced Flutter Developer to join our team for a 3-month project. You will be responsible for building high-quality UI components and integrating RESTful APIs. Experience with Clean Architecture and Provider is a plus.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),

            // Skills Required
            const Text(
              "Skills Required",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                _buildSkillChip("Flutter"),
                _buildSkillChip("Dart"),
                _buildSkillChip("API Integration"),
                _buildSkillChip("Git"),
              ],
            ),
            const SizedBox(height: 40),

            // Apply Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApplyJobScreen(
                      jobTitle: "Senior Flutter Developer",
                      budgetRange: "\$40 - \$70 / hr",
                    ),
                  ),
                );
              },
              child: const Text("Apply Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primaryBlue),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: AppColors.background,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  void _showApplySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Submit Proposal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(hintText: "Why should we hire you?"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
