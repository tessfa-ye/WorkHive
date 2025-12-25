import 'package:flutter/material.dart';
import 'package:workhive/features/marketplace/presentation/screens/client_home_screen.dart';
import 'package:workhive/features/marketplace/presentation/screens/freelancer_home_screen.dart';
import 'package:workhive/features/chat/presentation/screens/inbox_screen.dart';
import '../theme/app_colors.dart';
import '../../features/job_management/presentation/screens/milestone_tracker_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

class MainNavigationWrapper extends StatefulWidget {
  final String userRole;
  const MainNavigationWrapper({super.key, required this.userRole});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List of screens mapped to the BottomNavigationBar items
    final List<Widget> screens = [
      widget.userRole == 'client'
          ? const ClientHomeScreen()
          : const FreelancerHomeScreen(),
      MilestoneTrackerScreen(userRole: widget.userRole),
      const InboxScreen(),
      ProfileScreen(userRole: widget.userRole),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.textGrey,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded),
              activeIcon: Icon(Icons.work_rounded),
              label: "My Jobs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              activeIcon: Icon(Icons.chat_bubble_rounded),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
