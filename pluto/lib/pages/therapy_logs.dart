import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/health_dashboard.dart';

class TherapyLogs extends StatefulWidget {
  @override
  _TherapyLogsState createState() => _TherapyLogsState();
}

class _TherapyLogsState extends State<TherapyLogs> {
  int _selectedIndex = 2;
  String _sortBy = "Date";

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; // Avoid reloading the same page
    else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthDashboard()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthMetrics()),
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

  List<Map<String, dynamic>> therapyLogs = [
    {
      "date": "2024-09-12",
      "therapyType": "Speech Therapy",
      "therapist": "John Doe",
      "profileImage": "assets/john_doe.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.redAccent,
    },
    {
      "date": "2024-09-12",
      "therapyType": "Occupational Therapy",
      "therapist": "Julie Watson",
      "profileImage": "assets/julie_watson.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.green,
    },
    {
      "date": "2024-08-24",
      "therapyType": "Speech Therapy",
      "therapist": "John Doe",
      "profileImage": "assets/john_doe.png",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.redAccent,
    },
  ];

  /// Function to format date from "YYYY-MM-DD" to "12 Sep 2025"
  String formatDate(String dateStr) {
    DateTime parsedDate = DateTime.parse(dateStr);
    return DateFormat("dd MMM yyyy").format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensuring white background
      appBar: AppBar(
        backgroundColor:
            Colors.white, // White background for title & back button
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF242E49)),
        ),
        title: Text(
          'Therapy Logs',
          style: TextStyle(
            color: Color(0xFF242E49),
            fontSize: 24,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// **Sort By Row (Aligned to Left)**
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sort by: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: _sortBy,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) _sortBy = newValue;
                    });
                  },
                  items: ['Date', 'Therapy Type', 'Therapist']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// **Therapy Logs List**
            Expanded(
              child: ListView.builder(
                itemCount: therapyLogs.length,
                itemBuilder: (context, index) {
                  final log = therapyLogs[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **Formatted Date**
                        Text(
                          formatDate(log["date"]),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 4),

                        /// **Therapy Log Card**
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// **Profile Image**
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      log["profileImage"] ??
                                          "assets/default.png"),
                                ),
                                SizedBox(width: 12),

                                /// **Main Log Content**
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// **Therapy Type**
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: log["color"] ?? Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          log["therapyType"] ??
                                              "Unknown Therapy",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6),

                                      /// **Therapist Name**
                                      Text(
                                        log["therapist"] ?? "Unknown Therapist",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 6),

                                      /// **Therapy Description**
                                      Text(
                                        log["description"] ?? "No Description",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_sharp), label: "Metrics"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_sharp), label: "Notes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp), label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
