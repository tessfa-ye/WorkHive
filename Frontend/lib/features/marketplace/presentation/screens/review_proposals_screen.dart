import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ReviewProposalsScreen extends StatelessWidget {
  final String jobTitle;

  const ReviewProposalsScreen({super.key, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(jobTitle, style: const TextStyle(color: AppColors.textMain, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textMain),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "12 Proposals Received",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textGrey),
          ),
          const SizedBox(height: 16),
          _buildProposalCard(
            context,
            name: "Alex Rivera",
            role: "Senior Flutter Developer",
            rating: 4.9,
            price: "\$1,100",
            image: "https://i.pravatar.cc/150?img=11",
            coverLetter: "I have built over 15 high-performance Flutter apps and can deliver your e-commerce project in 3 weeks...",
          ),
          _buildProposalCard(
            context,
            name: "Sarah Chen",
            role: "Full Stack Engineer",
            rating: 5.0,
            price: "\$1,350",
            image: "https://i.pravatar.cc/150?img=5",
            coverLetter: "My expertise in Firebase and Flutter makes me a perfect fit for your real-time tracking requirements...",
          ),
          _buildProposalCard(
            context,
            name: "Jordan Smith",
            role: "Mobile UI Architect",
            rating: 4.7,
            price: "\$950",
            image: "https://i.pravatar.cc/150?img=12",
            coverLetter: "I focus on creating pixel-perfect designs that are responsive across all device sizes...",
          ),
        ],
      ),
    );
  }

  Widget _buildProposalCard(
    BuildContext context, {
    required String name,
    required String role,
    required double rating,
    required String price,
    required String image,
    required String coverLetter,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 24, backgroundImage: NetworkImage(image)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(role, style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(price, style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accentAmber, size: 14),
                      Text(" $rating", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            coverLetter,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.textMain, fontSize: 14, height: 1.4),
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Message"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to hire/accept proposal
                  },
                  child: const Text("Hire"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}