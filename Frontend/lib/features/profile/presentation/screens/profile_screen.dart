import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/navigation/main_navigation_wrapper.dart';

class ProfileScreen extends StatelessWidget {
  final String userRole; // Passed from MainNavigationWrapper

  const ProfileScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    // Determine opposite role for switching
    final bool isClient = userRole.toLowerCase() == 'client';
    final String oppositeRole = isClient ? 'freelancer' : 'client';
    final String switchLabel = isClient ? "Freelancer Mode" : "Client Mode";

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, // Settings icon
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.textMain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Profile Header (Role-Aware)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=11",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alex Rivera",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          isClient
                              ? "Hiring Manager"
                              : "Senior Flutter Developer",
                          style: const TextStyle(color: AppColors.textGrey),
                        ),
                        const SizedBox(height: 8),
                        _buildBadge(
                          isClient ? "Top Client" : "Verified Expert",
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigate to Edit Profile Form
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 2. Role Switcher (Upwork Style)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.swap_horiz_rounded, color: Colors.white),
                  ),
                  title: Text(
                    "Switch to $switchLabel",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Change to your ${isClient ? 'work' : 'hiring'} profile",
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.orange,
                  ),
                  onTap: () => _handleRoleSwitch(context, oppositeRole),
                ),
              ),
            ),

            // 3. Stats Section
            _buildStatsSection(isClient),

            // 4. Menu Sections
            _buildSection(context, "Account Settings", [
              _buildMenuTile(Icons.person_outline, "Personal Information"),
              _buildMenuTile(
                Icons.notifications_none_rounded,
                "Notification Settings",
              ),
              _buildMenuTile(Icons.security_outlined, "Security & Password"),
            ]),

            if (!isClient) // Freelancer specific menu
              _buildSection(context, "Work Tools", [
                _buildMenuTile(
                  Icons.account_balance_wallet_outlined,
                  "My Earnings",
                ),
                _buildMenuTile(Icons.history_edu_rounded, "My Portfolio"),
              ]),

            _buildSection(context, "Support", [
              _buildMenuTile(Icons.help_outline_rounded, "Help Center"),
              _buildMenuTile(Icons.description_outlined, "Terms of Service"),
            ]),

            // 5. Logout Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OutlinedButton(
                onPressed: () => _showLogoutDialog(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Logout Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Text(
              "WorkHive Version 1.0.2",
              style: TextStyle(color: AppColors.textGrey, fontSize: 12),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatsSection(bool isClient) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _statCard(
            isClient ? "Jobs Posted" : "Jobs Done",
            isClient ? "12" : "48",
          ),
          const SizedBox(width: 12),
          _statCard("Rating", "4.9/5"),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
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
              style: const TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textGrey,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildMenuTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textMain),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
        color: AppColors.textGrey,
      ),
      onTap: () {},
    );
  }

  void _handleRoleSwitch(BuildContext context, String newRole) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainNavigationWrapper(userRole: newRole),
      ),
      (route) => false,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to exit WorkHive?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            ),
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
