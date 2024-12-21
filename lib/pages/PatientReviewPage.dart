import 'package:flutter/material.dart';
import '../widgets/doctor_expansion_tile.dart';

class PatientReviewPage extends StatefulWidget {
  const PatientReviewPage({super.key});

  @override
  State<PatientReviewPage> createState() => _PatientReviewPageState();
}

class _PatientReviewPageState extends State<PatientReviewPage> {
  final List<Map<String, dynamic>> doctorData = [
    {
      'doctorName': 'Dr. John Doe',
      'patients': ['Alice', 'Bob', 'Charlie'],
    },
    {
      'doctorName': 'Dr. Jane Smith',
      'patients': ['Dave', 'Eve', 'Frank'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Reviews',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,  // Custom color for the app bar
        elevation: 4,  // Adds a shadow to the app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality can be added later
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: ListView.builder(
          itemCount: doctorData.length,
          itemBuilder: (context, index) {
            return DoctorExpansionTile(
              doctorName: doctorData[index]['doctorName']!,
              patients: List<String>.from(doctorData[index]['patients']),
            );
          },
        ),
      ),
    );
  }
}
