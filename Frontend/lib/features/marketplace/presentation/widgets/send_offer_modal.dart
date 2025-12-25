import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SendOfferModal extends StatefulWidget {
  final String freelancerName;
  const SendOfferModal({super.key, required this.freelancerName});

  @override
  State<SendOfferModal> createState() => _SendOfferModalState();
}

class _SendOfferModalState extends State<SendOfferModal> {
  final _priceController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24, right: 24, top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom + 32, // Adjusts for keyboard
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Offer to ${widget.freelancerName}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Price Input
          const Text("Contract Amount", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.attach_money, color: AppColors.primaryBlue),
              hintText: "Enter total budget",
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),

          // Deadline Picker
          const Text("Delivery Deadline", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 20, color: AppColors.textGrey),
                  const SizedBox(width: 12),
                  Text(
                    _selectedDate == null 
                        ? "Select Date" 
                        : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                    style: TextStyle(color: _selectedDate == null ? Colors.grey : AppColors.textMain),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Short Message
          const Text("Additional Terms", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "List any specific requirements or milestones...",
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 32),

          // Action Button
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Offer sent to ${widget.freelancerName}!")),
              );
            },
            child: const Text("Send Formal Offer"),
          ),
        ],
      ),
    );
  }
}