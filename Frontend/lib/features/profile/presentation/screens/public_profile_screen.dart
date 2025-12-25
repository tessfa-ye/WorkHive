import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PublicProfileScreen extends StatelessWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Collapsing Header
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.primaryBlue,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryBlue, Color(0xFF1A237E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=11"),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Alex Rivera",
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Senior Flutter Developer • 4.9 (124 reviews)",
                      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Profile Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("About Me", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    "High-performance mobile developer with 5+ years of experience in Flutter and Firebase. I specialize in building scalable marketplaces and fintech solutions.",
                    style: TextStyle(color: AppColors.textGrey, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  
                  const Text("Skills", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ["Flutter", "Dart", "Firebase", "Stripe", "Node.js", "UI/UX"]
                        .map((skill) => Chip(
                              label: Text(skill),
                              backgroundColor: AppColors.background,
                              side: BorderSide.none,
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 32),
                  
                  const Text("Portfolio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // 3. Portfolio Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/200?random=$index"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                childCount: 4,
              ),
            ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: _buildActionDock(),
    );
  }

  Widget _buildActionDock() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("Message"),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Hire Me"),
            ),
          ),
        ],
      ),
    );
  }
}