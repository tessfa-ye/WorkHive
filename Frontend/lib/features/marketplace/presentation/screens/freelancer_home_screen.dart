import 'package:flutter/material.dart';
import 'package:workhive/features/marketplace/presentation/screens/search_results_screen.dart';
import 'package:workhive/features/marketplace/presentation/widgets/filter_bottom_sheet.dart';
import '../../../../core/theme/app_colors.dart';

class FreelancerHomeScreen extends StatelessWidget {
  const FreelancerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Explore Jobs",
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.textMain,
            ),
          ),
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryBlue,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                // 1. Navigation on "Enter" key
    onSubmitted: (query) {
      if (query.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsScreen(initialQuery: query),
          ),
        );
      }
    },
                decoration: InputDecoration(
                  hintText: "Search for projects...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune, color: AppColors.primaryBlue),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                        ),
                        builder: (context) => const FilterBottomSheet(),
                      );
                    },
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: [
                  _CategoryChip(label: "Design", isSelected: true),
                  _CategoryChip(label: "Development"),
                  _CategoryChip(label: "Writing"),
                  _CategoryChip(label: "Marketing"),
                ],
              ),
            ),

            // Job List
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Recommended for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => const _JobCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Mobile App Developer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.bookmark_border, color: AppColors.textGrey),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "We need a Flutter developer to build a freelance marketplace app...",
            style: TextStyle(color: AppColors.textGrey, fontSize: 14),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                size: 16,
                color: AppColors.primaryBlue,
              ),
              const Text(
                " \$40/hr",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 36),
                ),
                child: const Text("Apply", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
