import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {}, 
            child: const Text("Mark all as read", style: TextStyle(color: AppColors.primaryBlue))
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            title: "New Offer Received!",
            description: "TechFlow Solutions sent you an offer for 'Mobile App Developer'.",
            time: "2 mins ago",
            icon: Icons.assignment_turned_in_rounded,
            iconColor: AppColors.primaryBlue,
            isUnread: true,
          ),
          _buildNotificationItem(
            title: "Message from Sarah Chen",
            description: "Is it possible to integrate the Stripe API by Friday?",
            time: "45 mins ago",
            icon: Icons.chat_bubble_rounded,
            iconColor: AppColors.accentAmber,
            isUnread: true,
          ),
          _buildNotificationItem(
            title: "Payment Released",
            description: "Your milestone payment for 'UI Design' (\$400) has been credited.",
            time: "3 hours ago",
            icon: Icons.account_balance_wallet_rounded,
            iconColor: Colors.green,
            isUnread: false,
          ),
          _buildNotificationItem(
            title: "Proposal Viewed",
            description: "Creative Studio just viewed your proposal for 'SaaS Website'.",
            time: "Yesterday",
            icon: Icons.visibility_rounded,
            iconColor: Colors.purple,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color iconColor,
    required bool isUnread,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.primaryBlue.withOpacity(0.03) : Colors.transparent,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontWeight: isUnread ? FontWeight.bold : FontWeight.w600, fontSize: 15)),
                    Text(time, style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: AppColors.primaryBlue, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}