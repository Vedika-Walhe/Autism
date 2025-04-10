import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluto/pages/profile_setup_therapist.dart';
import 'package:pluto/pages/therapist_schedule.dart';
import 'package:pluto/pages/therapist_home_page.dart';

class TherapyLogsTherapist extends StatefulWidget {
  const TherapyLogsTherapist({super.key});

  @override
  _TherapyLogsTherapistState createState() => _TherapyLogsTherapistState();
}

class _TherapyLogsTherapistState extends State<TherapyLogsTherapist> {
  final int _selectedIndex = 1;
  String _sortBy = "Date";

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return;
    else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>const TherapistHomePage()),
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

  List<Map<String, dynamic>> therapyLogs = [
    {
      "date": "2024-09-12",
      "therapyType": "Speech Therapy",
      "therapist": "John Doe",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.redAccent,
    },
    {
      "date": "2024-09-12",
      "therapyType": "Occupational Therapy",
      "therapist": "Julie Watson",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.green,
    },
    {
      "date": "2024-08-24",
      "therapyType": "Speech Therapy",
      "therapist": "John Doe",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "color": Colors.redAccent,
    },
  ];

  String formatDate(String dateStr) {
    DateTime parsedDate = DateTime.parse(dateStr);
    return DateFormat("dd MMM yyyy").format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
              color: Color(0xFF242E49)),
        ),
        title: const Text(
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Sort by: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
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
            const SizedBox(height: 10),
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
                        Text(
                          formatDate(log["date"]),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(Icons.person,
                                      size: 24, color: Colors.black54),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: log["color"] ?? Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          log["therapyType"] ??
                                              "Unknown Therapy",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        log["therapist"] ?? "Unknown Therapist",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        log["description"] ?? "No Description",
                                        style: const TextStyle(
                                            color: Colors.black87),
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
    );
  }
}
