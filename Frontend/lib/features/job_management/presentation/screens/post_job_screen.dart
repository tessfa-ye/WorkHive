import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory = 'Design';
  String _budgetType = 'Fixed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Post a New Project", style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textMain),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Project Title"),
              TextFormField(
                decoration: _buildInputDecoration("e.g. Build a Flutter E-commerce App"),
                validator: (v) => v!.isEmpty ? "Title is required" : null,
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Category"),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: ['Design', 'Development', 'Marketing', 'Writing'].map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (val) => setState(() => _selectedCategory = val!),
                decoration: _buildInputDecoration(""),
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Description"),
              TextFormField(
                maxLines: 5,
                decoration: _buildInputDecoration("Describe the project goals and requirements..."),
                validator: (v) => v!.length < 20 ? "Description is too short" : null,
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Budget Type"),
              Row(
                children: [
                  _buildBudgetOption("Fixed"),
                  const SizedBox(width: 12),
                  _buildBudgetOption("Hourly"),
                ],
              ),
              const SizedBox(height: 24),

              _buildSectionTitle("Budget Amount (\$)"),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration("e.g. 500"),
                validator: (v) => v!.isEmpty ? "Enter an amount" : null,
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle submission logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Project Posted Successfully!")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Post Project"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textMain)),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.background,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget _buildBudgetOption(String label) {
    bool isSelected = _budgetType == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _budgetType = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textMain,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}