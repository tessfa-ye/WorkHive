import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SearchResultsScreen extends StatefulWidget {
  final String initialQuery;
  const SearchResultsScreen({super.key, this.initialQuery = ""});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late TextEditingController _searchController;
  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textMain),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search jobs...",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, size: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: AppColors.primaryBlue),
            onPressed: () => _showFilterBottomSheet(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips Row
          Container(
            height: 60,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                _buildFilterChip("All"),
                _buildFilterChip("Fixed Price"),
                _buildFilterChip("Hourly"),
                _buildFilterChip("Remote"),
                _buildFilterChip("Full-time"),
              ],
            ),
          ),
          
          // Results List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Simulated count
              itemBuilder: (context, index) {
                return _buildSearchResultCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) => setState(() => selectedFilter = label),
        selectedColor: AppColors.primaryBlue.withOpacity(0.1),
        labelStyle: TextStyle(
          color: isSelected ? AppColors.primaryBlue : AppColors.textGrey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildSearchResultCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Senior Mobile Developer (Flutter)", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          const Text("Looking for a developer to migrate an iOS app to Flutter...", 
            maxLines: 2, overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("\$60 - \$90 / hr", 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              TextButton(
                onPressed: () {}, 
                child: const Text("View Details")
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Advanced Filters", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Experience Level", style: TextStyle(fontWeight: FontWeight.bold)),
            // Add Checkboxes or Sliders here...
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Apply Filters")),
          ],
        ),
      ),
    );
  }
}