import 'package:financial_advisor/screens/client_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'about_us_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(),
    const ClientScreen(),
    const AboutUsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Advisor App'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1A237E),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(Icons.people, size: 40, color: Color(0xFF1A237E)),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total Users',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          '1,234',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A237E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'User Growth (Monthly)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 500,
                  barGroups: [
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 300, color: const Color(0xFF1A237E))],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [BarChartRodData(toY: 400, color: const Color(0xFF1A237E))],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: 350, color: const Color(0xFF1A237E))],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [BarChartRodData(toY: 450, color: const Color(0xFF1A237E))],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('M${value.toInt()}');
                        },
                      ),
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
}