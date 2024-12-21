import 'package:flutter/material.dart';

class DoctorExpansionTile extends StatelessWidget {
  final String doctorName;
  final List<String> patients;

  const DoctorExpansionTile({
    super.key,
    required this.doctorName,
    required this.patients,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,  // Adds shadow for a more modern look
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),  // Rounded corners
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 15.0), // Adds padding to the title
        title: Text(
          doctorName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: const Icon(
          Icons.medical_services,
          color: Colors.blue,  // Adds a medical icon to the left of the doctor's name
        ),
        trailing: const Icon(
          Icons.expand_more,
          color: Colors.grey,  // Customize the arrow color
        ),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Padding for patient list
        backgroundColor: Colors.grey[100],  // Light background color for the expanded section
        children: patients
            .map((patient) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: Text(
            patient,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text(
            'Patient review details here...',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          tileColor: Colors.white, // White background for the patient list
        ))
            .toList(),
      ),
    );
  }
}
