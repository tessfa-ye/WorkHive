import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ApplyJobScreen extends StatefulWidget {
  final String jobTitle;
  final String budgetRange;

  const ApplyJobScreen({super.key, required this.jobTitle, required this.budgetRange});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedDuration = '1-3 Months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Submit Proposal", style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textMain),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Context
              Text(widget.jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("Client Budget: ${widget.budgetRange}", style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
              const Divider(height: 40),

              // 1. Bid Amount
              const Text("Your Bid Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.attach_money, color: AppColors.textGrey),
                  hintText: "0.00",
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                validator: (v) => v!.isEmpty ? "Please enter an amount" : null,
              ),
              const SizedBox(height: 24),

              // 2. Estimated Duration
              const Text("How long will this take?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedDuration,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                items: ['Less than 1 month', '1-3 Months', '3-6 Months', '6+ Months']
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedDuration = val!),
              ),
              const SizedBox(height: 24),

              // 3. Cover Letter
              const Text("Cover Letter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Describe why you are the best fit for this project...",
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                validator: (v) => v!.length < 50 ? "Please write a more detailed proposal" : null,
              ),
              const SizedBox(height: 40),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSuccessDialog(context);
                  }
                },
                child: const Text("Submit Proposal"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            const Text("Proposal Sent!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("The client will review your application and notify you soon.", textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close Dialog
                Navigator.pop(context); // Go back to Job Details
              },
              child: const Text("Great!"),
            ),
          ],
        ),
      ),
    );
  }
}