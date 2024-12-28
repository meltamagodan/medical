import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class PatientPayingList extends StatefulWidget {
  const PatientPayingList({super.key});

  @override
  State<PatientPayingList> createState() => _PatientPayingListState();
}

class _PatientPayingListState extends State<PatientPayingList> {
  final List<Map<String, dynamic>> patients = [
    {
      'id': 1,
      'patientName': 'أحمد محمد',
      'doctorName': 'د. أحمد',
      'date': DateTime(2024, 12, 25, 10, 30),
      'cost': 100.0
    },
    {
      'id': 2,
      'patientName': 'سارة علي',
      'doctorName': 'د. مريم',
      'date': DateTime(2024, 12, 26, 12, 0),
      'cost': 150.0
    },
    {
      'id': 3,
      'patientName': 'ليلى حسين',
      'doctorName': 'د. خالد',
      'date': DateTime(2024, 12, 30, 9, 15),
      'cost': 200.0
    },
    {
      'id': 4,
      'patientName': 'محمد عمر',
      'doctorName': 'د. ليلى',
      'date': DateTime(2025, 1, 2, 14, 0),
      'cost': 250.0
    },
    {
      'id': 5,
      'patientName': 'نور إبراهيم',
      'doctorName': 'د. أحمد',
      'date': DateTime(2024, 12, 29, 11, 45),
      'cost': 300.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('قائمة دفع المرضى', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 100.0,
              headingRowColor:
              WidgetStateColor.resolveWith((states) => Colors.teal.withOpacity(0.1)),
              columns: const [
                DataColumn(
                  label: Text(
                    'اسم المريض',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'تاريخ/وقت',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'اسم الطبيب',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'التكلفة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'دفع',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
              rows: patients.map((patient) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        patient['patientName'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        intl.DateFormat('yyyy-MM-dd HH:mm').format(patient['date']),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        patient['doctorName'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        '${patient['cost']} \$',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      ElevatedButton(
                        onPressed: () {}, // No functionality for now
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'دفع',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
