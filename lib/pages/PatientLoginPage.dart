import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CreativePatientRegistrationApp extends StatelessWidget {
  const CreativePatientRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreativePatientRegistrationPage(),
    );
  }
}

class CreativePatientRegistrationPage extends StatefulWidget {
  const CreativePatientRegistrationPage({super.key});

  @override
  State<CreativePatientRegistrationPage> createState() =>
      _CreativePatientRegistrationPageState();
}

class _CreativePatientRegistrationPageState
    extends State<CreativePatientRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedDoctor;

  final List<String> _doctors = [
    'الدكتورة سارة جونسون',
    'الدكتور مايكل لي',
    'الدكتورة إميلي ديفيس',
    'الدكتور جيمس سميث',
  ];

  bool _isLoading = false;

  Future<void> _registerPatient() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse('http://dr-rawsht-rasul.com/medical/register_patient.php'); // Change to your PHP script URL
      final response = await http.post(
        url,
        body: {
          'name': _nameController.text,
          'phone': _phoneController.text,
          'email': _emailController.text,
          'doctor': _selectedDoctor,
        },
      );

      setState(() {
        _isLoading = false;
      });

      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message']),
            backgroundColor: Colors.green,
          ),
        );
        _formKey.currentState!.reset();
        setState(() {
          _selectedDoctor = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message']),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[800]!, Colors.blue[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.health_and_safety_rounded,
                        size: 80, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "تسجيل المرضى",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Form Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name Field
                        _buildTextField(
                          controller: _nameController,
                          label: "الاسم الكامل",
                          icon: Icons.person,
                          validator: (value) => value == null || value.isEmpty
                              ? 'يرجى إدخال الاسم'
                              : null,
                        ),
                        const SizedBox(height: 15),

                        // Phone Field
                        _buildTextField(
                          controller: _phoneController,
                          label: "رقم الهاتف",
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          validator: (value) => value == null || value.isEmpty
                              ? 'يرجى إدخال رقم الهاتف'
                              : null,
                        ),
                        const SizedBox(height: 15),

                        // Email Field
                        _buildTextField(
                          controller: _emailController,
                          label: "البريد الإلكتروني (اختياري)",
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),

                        // Doctor Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedDoctor,
                          items: _doctors.map((doctor) {
                            return DropdownMenuItem(
                              value: doctor,
                              child: Text(doctor, textAlign: TextAlign.right),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: "اختيار الطبيب",
                            prefixIcon: const Icon(Icons.medical_services),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedDoctor = value;
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'يرجى اختيار الطبيب'
                              : null,
                        ),
                        const SizedBox(height: 30),

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: _isLoading ? null : _registerPatient,
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "تسجيل",
                                    style: TextStyle(fontSize: 18,color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
