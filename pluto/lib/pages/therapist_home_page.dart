import 'package:flutter/material.dart';

class TherapistHomePage extends StatefulWidget {
  @override
  _TherapistHomePageState createState() => _TherapistHomePageState();
}

class _TherapistHomePageState extends State<TherapistHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF242E49),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_graph_sharp), label: "Metrics"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books_sharp), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_sharp), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF092635),
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
                          child: Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Hi, XYZ!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Next appointment: 25 Nov, 2024',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
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
              SizedBox(height: 10),
              _buildPatientCard('John Doe'),
              _buildPatientCard('Jane Smith'),
              SizedBox(height: 20),
              Text(
                'Collaborating Therapists',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/avatar.png'),
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
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(color: Colors.yellow[700], fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart, color: Colors.yellow[700]),
                  label: Text(
                    'Check analytics',
                    style: TextStyle(color: Colors.yellow[700], fontSize: 16, fontWeight: FontWeight.bold),
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
