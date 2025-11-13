import 'package:flutter/material.dart';

class CuacaScreen extends StatelessWidget {
  const CuacaScreen({super.key});

  Widget _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoItem(Icons.water_drop, 'Kelembaban', '65%'),
        _buildInfoItem(Icons.air, 'Angin', '12 km/h'),
        _buildInfoItem(Icons.visibility, 'Jarak Pandang', '10 km'),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastCard(
    String day,
    IconData icon,
    String high,
    String low,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Icon(icon, color: Colors.white, size: 32)),
          Expanded(
            flex: 2,
            child: Text(
              '$high° / $low°',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca'),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'Bandung, Indonesia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Selasa, 4 November 2025',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 24),
              const Icon(Icons.cloud, size: 80, color: Colors.white),
              const SizedBox(height: 8),
              const Text(
                '22°',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Berawan',
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 24),
              _buildInfoRow(),
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Prakiraan 5 Hari',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildForecastCard('Rabu', Icons.wb_sunny, '24', '20'),
              const SizedBox(height: 8),
              _buildForecastCard('Kamis', Icons.cloud, '23', '19'),
              const SizedBox(height: 8),
              _buildForecastCard('Jumat', Icons.wb_cloudy, '22', '18'),
              const SizedBox(height: 8),
              _buildForecastCard('Sabtu', Icons.water_drop, '21', '17'),
              const SizedBox(height: 8),
              _buildForecastCard('Minggu', Icons.wb_sunny, '25', '20'),
            ],
          ),
        ),
      ),
    );
  }
}
