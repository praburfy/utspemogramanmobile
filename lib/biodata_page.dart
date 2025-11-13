import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key});

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _medsosController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();

  String? _selectedClass;
  String _selectedGender = 'Laki-laki';
  DateTime? _birthDate;

  final List<String> _kelasList = [
    'PEMOB AA',
    'PEMOB BB',
    'PEMOB CC',
    'PEMOB DD',
  ];

  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _birthDate = pickedDate;
        _tanggalController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  void _saveData() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✅ Data biodata tersimpan!'),
        backgroundColor: const Color(0xFF81C784), // hijau lembut
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7E57C2);
    const green = Color(0xFF81C784);
    const white = Color(0xFFFDFDFD);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Biodata Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7E57C2), Color(0xFF81C784)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 6,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9575CD), Color(0xFF7E57C2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Prabu',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'NIM: 152023163',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Form Card
            Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              shadowColor: purple.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lengkapi Informasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: purple,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildTextField(
                      controller: _namaController,
                      label: 'Nama Lengkap',
                      icon: Icons.person_outline,
                      accent: purple,
                    ),
                    const SizedBox(height: 16),

                    _buildDropdownField(purple),
                    const SizedBox(height: 16),

                    _buildTextField(
                      controller: _alamatController,
                      label: 'Alamat',
                      icon: Icons.location_on_outlined,
                      accent: purple,
                    ),
                    const SizedBox(height: 16),

                    _buildTextField(
                      controller: _medsosController,
                      label: 'Medsos (Instagram / X)',
                      icon: Icons.alternate_email,
                      accent: purple,
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Jenis Kelamin:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: const <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: 'Laki-laki',
                          label: Text('Laki-laki'),
                          icon: Icon(Icons.male),
                        ),
                        ButtonSegment<String>(
                          value: 'Perempuan',
                          label: Text('Perempuan'),
                          icon: Icon(Icons.female),
                        ),
                      ],
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(white),
                        foregroundColor: WidgetStateProperty.all(purple),
                      ),
                      selected: {_selectedGender},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          _selectedGender = newSelection.first;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: _tanggalController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: purple,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: purple,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onTap: _pickDate,
                    ),
                    const SizedBox(height: 24),

                    Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.save_rounded),
                        label: const Text(
                          'Simpan Data',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                          backgroundColor: green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: _saveData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color accent,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: accent),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 2),
        ),
      ),
    );
  }

  Widget _buildDropdownField(Color accent) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Kelas',
        prefixIcon: Icon(Icons.school, color: accent),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 2),
        ),
      ),
      value: _selectedClass,
      items: _kelasList.map((String kelas) {
        return DropdownMenuItem(value: kelas, child: Text(kelas));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedClass = value;
        });
      },
    );
  }
}
