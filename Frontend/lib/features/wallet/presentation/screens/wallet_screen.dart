import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("My Earnings", style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.help_outline, color: AppColors.textGrey), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 1. Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryBlue, Color(0xFF1A237E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(color: AppColors.primaryBlue.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              children: [
                const Text("Total Balance", style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 8),
                const Text("\$4,250.00", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryBlue,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text("Withdraw Funds", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // 2. Simple Earnings Chart (Visual Placeholder)
          const Text("Monthly Growth", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(40, "Oct"),
                _buildBar(70, "Nov"),
                _buildBar(100, "Dec"),
                _buildBar(60, "Jan"),
                _buildBar(90, "Feb"),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // 3. Transaction History
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recent Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("See All")),
            ],
          ),
          const SizedBox(height: 12),
          _buildTransactionItem(
            title: "Project: Flutter E-commerce",
            date: "Mar 12, 2024",
            amount: "+\$1,200",
            isCredit: true,
          ),
          _buildTransactionItem(
            title: "Withdrawal to Bank",
            date: "Mar 08, 2024",
            amount: "-\$500",
            isCredit: false,
          ),
          _buildTransactionItem(
            title: "Project: Logo Design",
            date: "Mar 05, 2024",
            amount: "+\$350",
            isCredit: true,
          ),
        ],
        ),
      ),
    );

  }

  Widget _buildBar(double heightFactor, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: heightFactor,
          decoration: BoxDecoration(
            color: heightFactor > 80 ? AppColors.primaryBlue : AppColors.primaryBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
      ],
    );
  }

  Widget _buildTransactionItem({required String title, required String date, required String amount, required bool isCredit}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isCredit ? Colors.green.shade50 : Colors.red.shade50,
            child: Icon(
              isCredit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
              color: isCredit ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date, style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isCredit ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}