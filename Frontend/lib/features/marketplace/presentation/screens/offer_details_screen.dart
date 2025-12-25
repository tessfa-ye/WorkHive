import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OfferDetailsScreen extends StatelessWidget {
  final String clientName;
  final String jobTitle;
  final String amount;
  final String deadline;

  const OfferDetailsScreen({
    super.key,
    required this.clientName,
    required this.jobTitle,
    required this.amount,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Offer Details", style: TextStyle(color: AppColors.textMain)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textMain),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Client Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(clientName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text("Verified Client • ★ 4.8", style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 2. Project Title
            const Text("Project", style: TextStyle(color: AppColors.textGrey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(jobTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),

            // 3. Contract Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryBlue.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  _buildContractStat("Budget", amount, Icons.payments_outlined),
                  const SizedBox(width: 20),
                  Container(width: 1, height: 40, color: Colors.grey.shade300),
                  const SizedBox(width: 20),
                  _buildContractStat("Deadline", deadline, Icons.calendar_today_outlined),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 4. Terms & Description
            const Text("Offer Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              "I am looking for an expert to complete the UI/UX for my SaaS platform. This includes 15 high-fidelity screens, a component library, and responsive versions for tablet and mobile. Please follow the style guide attached in the chat.",
              style: TextStyle(color: AppColors.textMain, height: 1.6, fontSize: 15),
            ),
            const SizedBox(height: 40),

            // 5. Warning Note
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, color: Colors.amber, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "By accepting this offer, you agree to the project milestones and WorkHive's terms of service.",
                      style: TextStyle(color: Colors.brown, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Decline"),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to accept contract and move to "Active Jobs"
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(backgroundColor: Colors.green, content: Text("Offer Accepted! Project is now active.")),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Accept Offer"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContractStat(String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.primaryBlue),
              const SizedBox(width: 4),
              Text(label, style: const TextStyle(color: AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        ],
      ),
    );
  }
}