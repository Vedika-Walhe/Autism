import 'package:flutter/material.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/therapy_logs.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/health_dashboard.dart';

class HealthMetrics extends StatefulWidget {
  const HealthMetrics({super.key});

  @override
  _HealthMetricsState createState() => _HealthMetricsState();
}

class _HealthMetricsState extends State<HealthMetrics> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; // Avoid reloading the same page
    else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthDashboard()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TherapyLogs()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ParentSchedule()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileSetupPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
              color: Color(0xFF242E49)),
        ),
        title: const Text(
          'Smart Health Metrics',
          style: TextStyle(
            color: Color(0xFF242E49),
            fontSize: 24,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/bodytemperature'),
              child: HealthMetricCard(
                asset: "assets/bodyTemp.png",
                title: "Body Temperature",
                value: "97",
                unit: "°F",
                bgColor: const Color(0xFF60AFF9),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/heartrate'),
              child: HealthMetricCard(
                asset: "assets/heartRate.png",
                title: "Heart Rate",
                value: "120",
                unit: "bpm",
                bgColor: const Color(0xFFFC3A2E),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/skinConductance'),
              child: HealthMetricCard(
                asset: "assets/skinConductance.png",
                title: "Skin Conductance",
                value: "15",
                unit: "μS",
                bgColor: const Color(0xFF5CFF76),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF242E49),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            label: "Metrics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_sharp),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HealthMetricCard extends StatelessWidget {
  final String asset;
  final String title;
  final String value;
  final String unit;
  final Color bgColor;

  const HealthMetricCard({
    super.key,
    required this.asset,
    required this.title,
    required this.value,
    required this.unit,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 135,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: 60, height: 60, fit: BoxFit.contain),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Plus Jakarta Sans',
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
