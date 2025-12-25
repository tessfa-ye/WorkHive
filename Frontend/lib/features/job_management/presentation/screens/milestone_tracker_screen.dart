import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class MilestoneTrackerScreen extends StatelessWidget {
  final String userRole; // Add this to handle role-based views

  const MilestoneTrackerScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            userRole == 'client' ? "Manage Projects" : "My Active Contracts",
            style: const TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primaryBlue,
            unselectedLabelColor: AppColors.textGrey,
            indicatorColor: AppColors.primaryBlue,
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProjectList(context, isActive: true),
            _buildProjectList(context, isActive: false),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectList(BuildContext context, {required bool isActive}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: isActive ? 2 : 5,
      itemBuilder: (context, index) {
        return _buildProjectCard(
          context,
          title: index == 0 ? "E-commerce App Mobile" : "UI/UX Redesign",
          partnerName: userRole == 'client' ? "Alex Rivera" : "TechFlow Corp",
          progress: index == 0 ? 0.65 : 1.0,
          status: isActive ? "In Progress" : "Paid",
        );
      },
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required String partnerName,
    required double progress,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              _buildStatusBadge(status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "${userRole == 'client' ? 'Freelancer' : 'Client'}: $partnerName",
            style: const TextStyle(color: AppColors.textGrey, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Progress", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
              Text("${(progress * 100).toInt()}%", style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.background,
            color: progress == 1.0 ? Colors.green : AppColors.primaryBlue,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Navigate to specific milestone breakdown
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryBlue),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("View Details & Milestones"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status == "Paid" ? Colors.green.withOpacity(0.1) : AppColors.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: status == "Paid" ? Colors.green : AppColors.primaryBlue,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}