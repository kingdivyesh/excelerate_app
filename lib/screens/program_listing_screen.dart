import 'package:flutter/material.dart';

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
        title: const Text('Programs'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                program['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(program['description']!),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/programDetails',
                    arguments: program,
                  );
                },
                child: const Text('View'),
              ),
            ),
          );
        },
      ),
    );
  }
}
