import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'chat_details_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textMain),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, indent: 80),
        itemBuilder: (context, index) {
          // Mock data for the list
          final String name = index == 0
              ? "Sarah Jenkins"
              : "TechFlow Solutions";
          final String imageUrl = "https://i.pravatar.cc/150?u=$index";

          return _buildChatTile(
            context,
            name: name,
            message: "I've reviewed your proposal. Can we jump on a call?",
            time: "10:45 AM",
            unreadCount: index == 0 ? 2 : 0,
            imageUrl: imageUrl,
          );
        },
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    required int unreadCount,
    required String imageUrl,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            time,
            style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: unreadCount > 0
                      ? AppColors.textMain
                      : AppColors.textGrey,
                  fontWeight: unreadCount > 0
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
      onTap: () {
        // Navigates to the details screen and passes the data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatDetailsScreen(userName: name, userImage: imageUrl),
          ),
        );
      },
    );
  }
}
