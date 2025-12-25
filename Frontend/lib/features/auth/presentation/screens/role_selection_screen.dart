// import 'package:flutter/material.dart';
// import '../../../../core/theme/app_colors.dart';
// import 'login_screen.dart';

// class RoleSelectionScreen extends StatefulWidget {
//   const RoleSelectionScreen({super.key});

//   @override
//   State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
// }

// class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
//   String? selectedRole; // 'client' or 'freelancer'

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               const Text(
//                 "Choose Your Role",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textMain,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 "Select how you want to use WorkHive. You can change this later in settings.",
//                 style: TextStyle(fontSize: 16, color: AppColors.textGrey),
//               ),
//               const SizedBox(height: 40),
              
//               // Client Option
//               _RoleCard(
//                 title: "I want to Hire",
//                 subtitle: "I'm looking for skilled professionals for my projects.",
//                 icon: Icons.business_center_rounded,
//                 isSelected: selectedRole == 'client',
//                 onTap: () => setState(() => selectedRole = 'client'),
//               ),
              
//               const SizedBox(height: 20),
              
//               // Freelancer Option
//               _RoleCard(
//                 title: "I want to Work",
//                 subtitle: "I'm a freelancer looking for exciting new opportunities.",
//                 icon: Icons.person_search_rounded,
//                 isSelected: selectedRole == 'freelancer',
//                 onTap: () => setState(() => selectedRole = 'freelancer'),
//               ),
              
//               const Spacer(),
              
//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 56,
//                 child: ElevatedButton(
//                   onPressed: selectedRole == null 
//                     ? null 
//                     : () => Navigator.push(
//                         context, 
//                         MaterialPageRoute(
//                           // 🔥 FIX: Passing the selectedRole to LoginScreen
//                           builder: (context) => LoginScreen(initialRole: selectedRole)
//                         )
//                       ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: selectedRole == null 
//                         ? Colors.grey 
//                         : AppColors.primaryBlue,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _RoleCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _RoleCard({
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: isSelected ? AppColors.primaryBlue : Colors.transparent,
//             width: 2,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: isSelected 
//                   ? AppColors.primaryBlue.withOpacity(0.1) 
//                   : AppColors.background,
//               child: Icon(icon, 
//                 color: isSelected ? AppColors.primaryBlue : AppColors.textGrey, 
//                 size: 30
//               ),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: isSelected ? AppColors.primaryBlue : AppColors.textMain,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: const TextStyle(fontSize: 14, color: AppColors.textGrey),
//                   ),
//                 ],
//               ),
//             ),
//             if (isSelected)
//               const Icon(Icons.check_circle, color: AppColors.primaryBlue),
//           ],
//         ),
//       ),
//     );
//   }
// }