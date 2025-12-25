import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("My Applications", style: TextStyle(color: AppColors.textMain)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildApplicationCard(
            jobTitle: "Mobile App Developer",
            company: "TechFlow Solutions",
            status: "Interviewing",
            statusColor: AppColors.accentAmber,
            date: "Applied 2 days ago",
          ),
          _buildApplicationCard(
            jobTitle: "UI/UX Designer",
            company: "Creative Studio",
            status: "Under Review",
            statusColor: AppColors.primaryBlue,
            date: "Applied 5 days ago",
          ),
          _buildApplicationCard(
            jobTitle: "Backend Engineer",
            company: "DataSync Inc.",
            status: "Declined",
            statusColor: Colors.redAccent,
            date: "Applied 1 week ago",
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationCard({
    required String jobTitle,
    required String company,
    required String status,
    required Color statusColor,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(company, style: const TextStyle(color: AppColors.textGrey)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
              TextButton(
                onPressed: () {},
                child: const Text("View Details", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}