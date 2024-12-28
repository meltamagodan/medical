import 'package:flutter/material.dart';
import 'package:medical/pages/DoctorsPayingArchive.dart';
import 'package:medical/pages/PatientHistoryArchive.dart';
import 'package:medical/pages/PatientLoginPage.dart';
import 'package:medical/pages/PatientPayingList.dart';
import 'package:medical/pages/PatientReviewPage.dart';
import 'package:medical/pages/SchedulePreviewArchive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CreativePatientRegistrationApp(),
    );
  }
}
