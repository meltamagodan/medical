import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class DoctorsPayingArchive extends StatefulWidget {
  const DoctorsPayingArchive({super.key});

  @override
  State<DoctorsPayingArchive> createState() => _DoctorsPayingArchiveState();
}

class _DoctorsPayingArchiveState extends State<DoctorsPayingArchive> {
  final List<Map<String, dynamic>> doctorPayments = [
    {
      'id': 1,
      'doctorName': 'د. أحمد',
      'paymentType': 'موعد',
      'date': DateTime(2024, 12, 25),
      'amount': 300.0,
    },
    {
      'id': 2,
      'doctorName': 'د. مريم',
      'paymentType': 'راتب شهري',
      'date': DateTime(2024, 12, 1),
      'amount': 5000.0,
    },
    {
      'id': 3,
      'doctorName': 'د. خالد',
      'paymentType': 'موعد',
      'date': DateTime(2024, 12, 30),
      'amount': 250.0,
    },
    {
      'id': 4,
      'doctorName': 'د. ليلى',
      'paymentType': 'موعد',
      'date': DateTime(2025, 1, 2),
      'amount': 400.0,
    },
    {
      'id': 5,
      'doctorName': 'د. أحمد',
      'paymentType': 'راتب شهري',
      'date': DateTime(2024, 12, 1),
      'amount': 4500.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('أرشيف دفع الأطباء', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 100.0,
              headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.teal.withOpacity(0.1),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'اسم الطبيب',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'نوع الدفع',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'التاريخ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'المبلغ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
              rows: doctorPayments.map((payment) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        payment['doctorName'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        payment['paymentType'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        intl.DateFormat('yyyy-MM-dd').format(payment['date']),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    DataCell(
                      Text(
                        '${payment['amount']} \$',
                        style: const TextStyle(fontSize: 16),
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
