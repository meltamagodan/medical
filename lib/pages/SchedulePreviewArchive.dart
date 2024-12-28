import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class SchedulePreviewArchive extends StatefulWidget {
  const SchedulePreviewArchive({super.key});

  @override
  State<SchedulePreviewArchive> createState() => _SchedulePreviewArchiveState();
}

class _SchedulePreviewArchiveState extends State<SchedulePreviewArchive> {

  final List<Map<String, dynamic>> appointments = [
    {'id': 1, 'patientName': 'أحمد محمد', 'doctorName': 'د. أحمد', 'date': DateTime(2024, 12, 25), 'phone': '123-456-7890'},
    {'id': 2, 'patientName': 'سارة علي', 'doctorName': 'د. مريم', 'date': DateTime(2024, 12, 26), 'phone': '987-654-3210'},
    {'id': 3, 'patientName': 'ليلى حسين', 'doctorName': 'د. خالد', 'date': DateTime(2024, 12, 30), 'phone': '555-123-4567'},
    {'id': 4, 'patientName': 'محمد عمر', 'doctorName': 'د. ليلى', 'date': DateTime(2025, 1, 2), 'phone': '444-555-6666'},
    {'id': 5, 'patientName': 'نور إبراهيم', 'doctorName': 'د. أحمد', 'date': DateTime(2024, 12, 29), 'phone': '321-654-9870'},
    {'id': 6, 'patientName': 'خالد محمود', 'doctorName': 'د. مريم', 'date': DateTime(2025, 1, 3), 'phone': '666-777-8888'},
  ];

  DateTime? startDate;
  DateTime? endDate;

  // Filter appointments based on the selected dates
  List<Map<String, dynamic>> get filteredAppointments {
    if (startDate == null || endDate == null) {
      return appointments;
    }
    return appointments.where((appointment) => appointment['date'].isAfter(startDate!.subtract(const Duration(days: 1))) && appointment['date'].isBefore(endDate!.add(const Duration(days: 1)))).toList();
  }

  // Method to pick a date range
  Future<void> _pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: startDate != null && endDate != null ? DateTimeRange(start: startDate!, end: endDate!) : null,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Right-to-Left layout
      child: Scaffold(
        appBar: AppBar(
          title: const Text('أرشيف المواعيد',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Date range filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startDate != null && endDate != null ? 'من: ${intl.DateFormat('yyyy-MM-dd').format(startDate!)}\nإلى: ${intl.DateFormat('yyyy-MM-dd').format(endDate!)}' : 'اختر نطاق التاريخ',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _pickDateRange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'تصفية التواريخ',
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Appointments table
              Expanded(
                child: filteredAppointments.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 100.0, // Increase space between columns

                          headingRowColor: WidgetStateColor.resolveWith((states) => Colors.teal.withOpacity(0.1)),
                          columns: const [
                            DataColumn(
                              label: Text(
                                'اسم المريض',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'اسم الطبيب',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'التاريخ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'رقم الهاتف',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: filteredAppointments.map((appointment) {
                            return DataRow(cells: [
                              DataCell(Text(appointment['patientName'])),
                              DataCell(Text(appointment['doctorName'])),
                              DataCell(Text(intl.DateFormat('yyyy-MM-dd').format(appointment['date']))),
                              DataCell(Text(appointment['phone'])),
                            ]);
                          }).toList(),
                        ),
                      )
                    : const Center(
                        child: Text(
                          'لا توجد مواعيد',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
