// pages/patient_review_page.dart
import 'package:flutter/material.dart';

class PatientReviewPage extends StatelessWidget {
  const PatientReviewPage({super.key});

  final List<Map<String, dynamic>> doctorData = const [
    {
      'name': 'Dr. Sarah Johnson',
      'patients': ['Alice Doe', 'John Smith', 'Emma Brown']
    },
    {
      'name': 'Dr. Michael Lee',
      'patients': ['Chris Evans', 'Paul Walker', 'Megan Fox']
    },
    {
      'name': 'Dr. Emily Davis',
      'patients': ['Sophia Loren', 'Ethan Hunt', 'Olivia Pope']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Reviews', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: doctorData.map((doctor) {
            return ExpansionTile(
              title: Text(doctor['name'], style: Theme.of(context).textTheme.titleLarge),
              children: (doctor['patients'] as List<String>).map((patient) {
                return ListTile(
                  title: Text(patient, style: Theme.of(context).textTheme.bodyMedium),
                  leading: Icon(Icons.person, color: Theme.of(context).colorScheme.secondary),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
