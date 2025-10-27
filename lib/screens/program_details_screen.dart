import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/gradients.dart';
import '../widgets/gradient_button.dart';
import 'feedback_screen.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final program = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kBrandGradient),
        ),
        title: Text(
          program?['title'] ?? 'Program Details',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              program?['title'] ?? '',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kDeepPurple,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              program?['description'] ??
                  'Learn more about this exciting program designed to enhance your professional skills and career opportunities.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            // Gradient Enroll Button
            Center(
              child: GradientButton(
                text: 'Enroll Now',
                onPressed: () async {
                  // ✅ Enrollment success animation
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 80,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Enrolled Successfully!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  // ⏳ Wait 2 seconds, close dialog, then go to Feedback screen
                  await Future.delayed(const Duration(seconds: 2));
                  if (context.mounted) {
                    Navigator.pop(context); // close dialog
                    Navigator.pushNamed(context, '/feedback');
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // Back button
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back to Programs',
                  style: TextStyle(
                    color: kCoral,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
