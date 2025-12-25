import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _budgetRange = const RangeValues(30, 150);
  String _selectedLevel = "Intermediate";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar for visual cue
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 24),
          
          const Text("Filter Jobs", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),

          // Experience Level Section
          const Text("Experience Level", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            children: ["Entry", "Intermediate", "Expert"].map((level) {
              bool isSelected = _selectedLevel == level;
              return ChoiceChip(
                label: Text(level),
                selected: isSelected,
                onSelected: (val) => setState(() => _selectedLevel = level),
                selectedColor: AppColors.primaryBlue.withOpacity(0.1),
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primaryBlue : AppColors.textMain,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                side: BorderSide(color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!),
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          // Budget Range Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hourly Rate", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                "\$${_budgetRange.start.round()} - \$${_budgetRange.end.round()}",
                style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          RangeSlider(
            values: _budgetRange,
            min: 10,
            max: 300,
            divisions: 29,
            activeColor: AppColors.primaryBlue,
            inactiveColor: AppColors.background,
            onChanged: (values) => setState(() => _budgetRange = values),
          ),

          const SizedBox(height: 40),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Reset"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Apply Filters"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}