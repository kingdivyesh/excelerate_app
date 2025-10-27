import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandPrimaryColor = kCoral;
    const Color brandAccentColor = kDeepPurple;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: brandPrimaryColor,
        // 🧭 White logo background for visibility
        title: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            'assets/logo.webp',
            height: 36,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.school, color: kCoral, size: 32),
          ),
        ),
        // 🧹 Removed leading (no back button on home)
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),

      // ✨ Scrollable body for small devices
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Progress/success icon
            Icon(Icons.trending_up, size: 80, color: brandAccentColor),

            const SizedBox(height: 20),

            const Text(
              'Your journey starts here!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to Excelerate!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: brandAccentColor,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Empowering learners through professional development programs.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),

            const SizedBox(height: 40),

            // ✨ Gradient Buttons
            GradientButton(
              text: 'View Programs',
              onPressed: () {
                Navigator.pushNamed(context, '/programListing');
              },
            ),

            const SizedBox(height: 20),

            GradientButton(
              text: 'Edit Profile',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile editing coming soon!')),
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
