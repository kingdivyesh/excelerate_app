import 'package:flutter/material.dart';
import '../theme/gradients.dart';
import '../widgets/gradient_button.dart';

class ProgramListingScreen extends StatelessWidget {
  const ProgramListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = [
      {
        'title': 'AI for Beginners',
        'description': 'Learn AI basics and build your first model.',
      },
      {
        'title': 'Web Development Bootcamp',
        'description': 'Master Flutter & web app building.',
      },
      {
        'title': 'Data Science with Python',
        'description': 'Analyze data & create dashboards.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Programs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kBrandGradient),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    program['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    program['description']!,
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    text: 'View',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/programDetails',
                        arguments: program,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
