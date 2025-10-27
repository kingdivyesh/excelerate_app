import 'package:flutter/material.dart';
import '../theme/gradients.dart';
import '../widgets/gradient_button.dart';
import '../services/api_service.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  final ApiService apiService = ApiService();
  bool isLoading = true;
  List<dynamic> programs = [];

  @override
  void initState() {
    super.initState();
    fetchProgramData();
  }

  Future<void> fetchProgramData() async {
    try {
      final data = await apiService.fetchPrograms();
      setState(() {
        programs = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching programs: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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

      // 🧭 BODY SECTION
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : programs.isEmpty
          ? const Center(
              child: Text(
                'No programs available.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
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
                          program['title'] ?? 'Untitled Program',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          program['description'] ?? 'No description available.',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
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
