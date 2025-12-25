import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatDetailsScreen({super.key, required this.userName, required this.userImage});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Icon(Icons.arrow_back, color: AppColors.textMain),
              const SizedBox(width: 4),
              CircleAvatar(radius: 16, backgroundImage: NetworkImage(widget.userImage)),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userName, style: const TextStyle(color: AppColors.textMain, fontSize: 16, fontWeight: FontWeight.bold)),
            const Text("Online", style: TextStyle(color: Colors.green, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam_outlined, color: AppColors.textMain), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: AppColors.textMain), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMessageBubble(
                  message: "Hi Alex! I saw your proposal for the E-commerce app.",
                  time: "10:30 AM",
                  isMe: false,
                ),
                _buildMessageBubble(
                  message: "Hey! Yes, I'm very interested. I've built similar apps using Flutter and Stripe.",
                  time: "10:32 AM",
                  isMe: true,
                ),
                _buildMessageBubble(
                  message: "Great. Can you show me some examples of your previous work with payment gateways?",
                  time: "10:35 AM",
                  isMe: false,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({required String message, required String time, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(color: isMe ? Colors.white : AppColors.textMain, fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(color: isMe ? Colors.white70 : AppColors.textGrey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Color(0xFFEEEEEE)))),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryBlue), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: const TextStyle(color: AppColors.textGrey),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: AppColors.primaryBlue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 18),
              onPressed: () {
                _messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}