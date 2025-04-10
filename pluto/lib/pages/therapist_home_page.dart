import 'package:flutter/material.dart';
import 'package:pluto/pages/therapy_logs_therapist.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/therapy_logs.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/health_dashboard.dart';
import 'package:pluto/pages/profile_setup_therapist.dart';
import 'package:pluto/pages/therapist_schedule.dart';

class TherapistHomePage extends StatefulWidget {
  const TherapistHomePage({super.key});

  @override
  _TherapistHomePageState createState() => _TherapistHomePageState();
}

class _TherapistHomePageState extends State<TherapistHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _therapistpages = [
    TherapistHomePage(),
    TherapyLogsTherapist(),
    TherapistSchedule(),
    ProfileSetupTherapist(),
  ];
  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; 
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TherapyLogsTherapist()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TherapistSchedule()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSetupTherapist()),
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF242E49),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_sharp), label: "Notes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp), label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF092635),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person,
                              size: 30, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'HI, Reshma!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Next appointment: 1 April, 2025',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Patients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View details',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildPatientCard('John Doe'),
              _buildPatientCard('Jane Smith'),
              const SizedBox(height: 20),
              const Text(
                'Collaborating Therapists',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  4,
                  (index) =>  CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.person, size: 35, color: Colors.black54),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientCard(String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      shadowColor: Colors.grey[300],
      color: Colors.white, // Ensures background is white
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person, size: 35, color: Colors.black54),
                          ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.note, color: Colors.yellow[700]),
                  label: Text(
                    'Add notes',
                    style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart, color: Colors.yellow[700]),
                  label: Text(
                    'Check analytics',
                    style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
