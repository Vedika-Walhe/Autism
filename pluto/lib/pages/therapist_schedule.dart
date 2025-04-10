import 'package:flutter/material.dart';
import 'package:pluto/pages/therapy_logs_therapist.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/therapy_logs.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/health_dashboard.dart';
import 'package:pluto/pages/profile_setup_therapist.dart';
import 'package:pluto/pages/therapist_home_page.dart';

class TherapistSchedule extends StatefulWidget {
  const TherapistSchedule({super.key});

  @override
  _TherapistScheduleState createState() => _TherapistScheduleState();
}

class _TherapistScheduleState extends State<TherapistSchedule> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; 
    else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TherapistHomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TherapyLogsTherapist()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSetupTherapist()),
      );
    } 
  }
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  void _addTherapySession() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Add Therapy Session"),
        duration: Duration(seconds: 2),
      ),
    );
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
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF242E49)),
        ),
        title: const Text(
          'Calendar',
          style: TextStyle(
            color: Color(0xFF242E49),
            fontSize: 24,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false, // Removed the week button
              leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF242E49)),
              rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF242E49)),
            ),
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Color(0xFF242E49), // Yellow bubble for selected date
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Color(0xFFFC3A2E),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Schedule",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "april 1, 2025", // Example Date
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "10:00 AM - 11:00 AM", // Example Time
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15), // Spacing between text and box
                Expanded( // Used Expanded to prevent overflow
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF092635), // Dark greenish color
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          child: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person, size: 35, color: Colors.black54),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Speech Therapy",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "John Doe",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTherapySession,
        backgroundColor: const Color(0xFF242E49),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
