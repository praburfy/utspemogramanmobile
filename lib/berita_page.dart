import 'package:flutter/material.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({super.key});

  final List<Map<String, String>> beritaList = const [
    {
      'judul': 'Teknologi AI Terbaru 2025',
      'deskripsi':
          'AI kini semakin canggih dan digunakan di berbagai bidang, mulai dari pendidikan hingga kesehatan.',
    },
    {
      'judul': 'Cuaca Ekstrem di Indonesia',
      'deskripsi':
          'BMKG memprediksi hujan lebat dan angin kencang akan terjadi di beberapa wilayah Indonesia minggu ini.',
    },
    {
      'judul': 'Flutter 4.0 Dirilis',
      'deskripsi':
          'Versi terbaru Flutter hadir dengan performa rendering yang lebih cepat dan dukungan lintas platform yang lebih baik.',
    },
    {
      'judul': 'Ekonomi Digital Tumbuh Pesat',
      'deskripsi':
          'Ekonomi digital Indonesia tumbuh 15% pada tahun 2025 berkat adopsi e-commerce dan pembayaran digital.',
    },
    {
      'judul': 'Mahasiswa Indonesia Raih Prestasi di Olimpiade Sains',
      'deskripsi':
          'Tim mahasiswa Indonesia berhasil meraih medali emas di ajang Olimpiade Sains Internasional di Tokyo.',
    },
    {
      'judul': 'Startup Lokal Kembangkan Mobil Listrik Murah',
      'deskripsi':
          'Sebuah startup di Bandung menciptakan mobil listrik dengan harga terjangkau dan efisiensi tinggi.',
    },
    {
      'judul': 'Kesehatan Mental Jadi Fokus Utama 2025',
      'deskripsi':
          'Pemerintah meluncurkan program nasional untuk meningkatkan kesadaran dan akses layanan kesehatan mental.',
    },
    {
      'judul': 'Pendidikan Hybrid Jadi Tren Baru',
      'deskripsi':
          'Sekolah dan universitas mulai menerapkan sistem hybrid untuk meningkatkan fleksibilitas belajar.',
    },
    {
      'judul': 'Game Lokal Tembus Pasar Internasional',
      'deskripsi':
          'Game buatan developer Indonesia berhasil menembus pasar global dan masuk dalam daftar populer di Steam.',
    },
    {
      'judul': 'Astronom Temukan Planet Mirip Bumi',
      'deskripsi':
          'NASA mengumumkan penemuan planet baru dengan kondisi atmosfer yang mirip dengan Bumi.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: const Text('Berita Terkini'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: beritaList.length,
          itemBuilder: (context, index) {
            final berita = beritaList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      berita['judul']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      berita['deskripsi']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
