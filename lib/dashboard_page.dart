import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BiodataScreen(),
    KontakScreen(),
    KalkulatorScreen(),
    CuacaScreen(),
    BeritaScreen(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.person, 'label': 'Biodata'},
    {'icon': Icons.contacts, 'label': 'Kontak'},
    {'icon': Icons.calculate, 'label': 'Kalkulator'},
    {'icon': Icons.cloud, 'label': 'Cuaca'},
    {'icon': Icons.article, 'label': 'Berita'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌈 APP BAR DENGAN GRADIENT UNGU-HIJAU
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E24AA), Color(0xFF43A047)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'UTS Mobile App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
          elevation: 4,
        ),
      ),

      // 🌿 DRAWER
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8E24AA), Color(0xFF43A047)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                accountName: const Text(
                  'Muhamad Prabu Renanda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                accountEmail: const Text(
                  '152023163',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _navItems.length,
                itemBuilder: (context, index) {
                  final selected = _currentIndex == index;
                  return _buildDrawerItem(
                    icon: _navItems[index]['icon'],
                    title: _navItems[index]['label'],
                    index: index,
                    selected: selected,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Info Aplikasi',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('v1.0.0', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🌸 BODY DENGAN ANIMASI LEMBUT
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF9FAFB), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: _pages[_currentIndex],
        ),
      ),

      // 🌟 BOTTOM NAVIGATION BAR CUSTOM
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF8E24AA), Color(0xFF43A047)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) => setState(() => _currentIndex = index),
          items: _navItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item['icon']),
                  label: item['label'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // 🔹 CUSTOM DRAWER ITEM
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
    required bool selected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF8E24AA).withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? const Color(0xFF43A047) : Colors.grey[800],
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            color: selected ? const Color(0xFF8E24AA) : Colors.black87,
          ),
        ),
        onTap: () {
          setState(() => _currentIndex = index);
          Navigator.pop(context);
        },
      ),
    );
  }
}
