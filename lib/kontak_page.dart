import 'package:flutter/material.dart';

class KontakScreen extends StatelessWidget {
  const KontakScreen({super.key});

  static const List<Map<String, String>> contacts = [
    {'name': 'Ahmad Rizki', 'phone': '081234567890'},
    {'name': 'Siti Nurhaliza', 'phone': '081234567891'},
    {'name': 'Budi Santoso', 'phone': '081234567892'},
    {'name': 'Dewi Lestari', 'phone': '081234567893'},
    {'name': 'Eko Prasetyo', 'phone': '081234567894'},
    {'name': 'Fitri Handayani', 'phone': '081234567895'},
    {'name': 'Gilang Ramadhan', 'phone': '081234567896'},
    {'name': 'Hana Pertiwi', 'phone': '081234567897'},
    {'name': 'Irfan Hakim', 'phone': '081234567898'},
    {'name': 'Joko Widodo', 'phone': '081234567899'},
    {'name': 'Kartika Sari', 'phone': '081234567800'},
    {'name': 'Linda Wijaya', 'phone': '081234567801'},
    {'name': 'Michael Tan', 'phone': '081234567802'},
    {'name': 'Nina Agustin', 'phone': '081234567803'},
    {'name': 'Omar Abdullah', 'phone': '081234567804'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Daftar Kontak',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF1E3A8A),
                    child: Text(
                      contact['name']![0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(contact['name']!),
                  subtitle: Text(contact['phone']!),
                  trailing: const Icon(Icons.phone, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
