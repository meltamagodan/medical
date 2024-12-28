import 'package:flutter/material.dart';

class PatientHistoryArchive extends StatelessWidget {
  const PatientHistoryArchive({super.key});

  final List<Map<String, String>> patientData = const [
    {
      'name': 'جون دو',
      'date': '2024-12-20',
      'doctor': 'د. سميث',
      'payment': '\$120',
      'phone': '123-456-7890',
    },
    {
      'name': 'جين رو',
      'date': '2024-12-19',
      'doctor': 'د. ألين',
      'payment': '\$100',
      'phone': '987-654-3210',
    },
    {
      'name': 'أليس براون',
      'date': '2024-12-18',
      'doctor': 'د. كارتر',
      'payment': '\$80',
      'phone': '555-123-4567',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كشف سجل المرضى', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: patientData.length,
        itemBuilder: (context, index) {
          final patient = patientData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      patient['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      patient['date']!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12.0)),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildDetail(':الطبيب', patient['doctor']!),
                            _buildDetail(':الدفع', patient['payment']!),
                            _buildDetail(':الهاتف', patient['phone']!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Row(
      children: [


        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
