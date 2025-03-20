import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTemperatureScreen extends StatefulWidget {
  const BodyTemperatureScreen({super.key});

  @override
  _BodyTemperatureScreenState createState() => _BodyTemperatureScreenState();
}

class _BodyTemperatureScreenState extends State<BodyTemperatureScreen> {
  int _selectedIndex = 0; // For BottomNavigationBar
  int _selectedTabIndex = 0; // For "Day, Month, Year, All" tabs
  final List<String> _tabs = ["Day", "Month", "Year", "All"];

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 32;
    double tabWidth = containerWidth / _tabs.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF242E49)),
          onPressed: () {},
        ),
        title: Text(
          "Body Temperature",
          style: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF242E49)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "97°F",
              style: GoogleFonts.poppins(
                  fontSize: 65, fontWeight: FontWeight.bold, color: Color(0xFF242E49)),
            ),
            const SizedBox(height: 30),
            Container(
              width: containerWidth,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF242E49).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: _selectedTabIndex * tabWidth,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: tabWidth,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF242E49),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300, width: 1), // Light gray border
                      ),
                    ),
                  ),
                  Row(
                    children: _tabs.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String text = entry.value;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTabIndex = idx;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              text,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedTabIndex == idx ? Colors.white : Color(0xFF242E49)),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
              ),
              child: const Center(child: Text("Graph will be here")),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Anomalies",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF242E49)), // Increased size
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 120, // Adjusted height for better scrolling
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    anomalyCard("High", Colors.red),
                    const SizedBox(width: 12),
                    anomalyCard("Moderate", Colors.green),
                    const SizedBox(width: 12),
                    anomalyCard("Low", Colors.blue),
                  ],
                ),
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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

  Widget anomalyCard(String label, Color color) {
    return Container(
      width: 140, // Increased width for better visibility
      height: 110, // Increased height
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-aligned title
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold, color: color), // Increased size
          ),
          const Spacer(),
          Center(
            child: Icon(Icons.show_chart, color: color, size: 40), // Bigger icon
          ),
        ],
      ),
    );
  }
}
