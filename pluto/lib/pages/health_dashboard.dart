import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pluto/pages/profile_setup_page.dart';
import 'package:pluto/pages/therapy_logs.dart';
import 'package:pluto/pages/parent_schedule.dart';
import 'package:pluto/pages/HealthMetrics.dart';
import 'package:pluto/pages/therapy_logs_therapist.dart';
import 'package:pluto/pages/therapist_home_page.dart';  
import 'package:pluto/pages/therapist_schedule.dart';
import 'package:pluto/pages/profile_setup_therapist.dart';  

class HealthDashboard extends StatefulWidget {
  const HealthDashboard({super.key});

  @override
  State<HealthDashboard> createState() => _HealthDashboardState();
}

class _HealthDashboardState extends State<HealthDashboard> {
  // Added variable to track selected index for bottom navigation
  int _selectedIndex = 0;

  // Define colors from the provided color codes
  final Color darkBlue = const Color(0xFF242E49);
  final Color lightGreen = const Color(0xFF9EC8B9);
  final Color blue = const Color(0xFF60AFF9);
  final Color red = const Color(0xFFFC3A2E);
  final Color brightGreen = const Color(0xFF5CFF76);
  final List<Widget> _parentpages = [
    HealthDashboard(),
    HealthMetrics(),
    TherapyLogs(),
    ParentSchedule(),
    ProfileSetupPage(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; // Avoid reloading the same page
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthMetrics()),
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

  // Mock health metrics
  // List of health metrics with JSON filenames
  List<Map<String, dynamic>> healthMetrics = [
    {
      'title': 'Body Temperature',
      'value': 'Loading...', // Placeholder
      'unit': '°F',
      'icon': 'assets/bodyTemp.png',
      'color': const Color(0xFF60AFF9),
      'file': 'body_temperature.json',
    },
    {
      'title': 'Heart Rate',
      'value': 'Loading...',
      'unit': 'bpm',
      'icon': 'assets/heartRate.png',
      'color': const Color(0xFFFC3A2E),
      'file': 'heart_rate.json',
    },
    {
      'title': 'Skin Conductance',
      'value': 'Loading...',
      'unit': 'μS',
      'icon': 'assets/skinConductance.png',
      'color': const Color(0xFF5CFF76),
      'file': 'skin_conductance.json',
    },
  ];

  @override
  void initState() {
    super.initState();
    loadHealthMetrics();
  }

  // Function to fetch values from JSON
  Future<double> fetchMetricValue(String filename) async {
    try {
      String data = await rootBundle.loadString('assets/health_metrics/$filename');
      final jsonResult = json.decode(data);
      debugPrint("Loaded $filename: ${jsonResult.toString()}"); // Debugging
      if (jsonResult.containsKey("value")) {
        return jsonResult["value"].toDouble();
      } else {
        debugPrint("Key 'value' not found in $filename");
        return 0.0;
      }
    } catch (e) {
      debugPrint("Error loading $filename: $e");
      return 0.0; // Fallback value
    }
  }

  // Load JSON data and update the UI
  void loadHealthMetrics() async {
    List<Map<String, dynamic>> updatedMetrics = [];

    for (var metric in healthMetrics) {
      double value = await fetchMetricValue(metric['file']);
      updatedMetrics.add({...metric, 'value': value.toString()});
    }

    setState(() {
      healthMetrics = updatedMetrics;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and appointment header - INCREASED HEIGHT
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: darkBlue,
              child: Row(
                children: [
                  // Avatar circle
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: lightGreen.withOpacity(0.2),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white.withOpacity(0.9),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Text greeting - Using Expanded to prevent overflow
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'HI, Aakash!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Increased font size
                          ),
                        ),
                        const SizedBox(height: 15), // Increased spacing
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Next appointment: 1 April, 2025',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Main content area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Smart Health Metrics section title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Smart Health Metrics',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HealthMetrics()), // Replace with your target page
                            );
                          },
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue, // Make it look like a link
                              decoration: TextDecoration
                                  .underline, // Optional: Adds underline for link effect
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Horizontally scrollable health metrics - FIXED WIDTH ISSUES
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: healthMetrics.length,
                        itemBuilder: (context, index) {
                          final metric = healthMetrics[index];
                          return Container(
                            width: 130, // Kept the width the same
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: metric['color'],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize:
                                  MainAxisSize.min, // For preventing overflow
                              children: [
                                // Added icon at the top
                                
                                // Made title two lines with proper wrapping
                                SizedBox(
                                  height: 60, // Fixed height for two lines
                                  child: Text(
                                    metric['title'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold, // Changed to bold
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  metric[
                                      'icon'], // Get image path from healthMetrics list
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit
                                      .contain, // Ensures the image fits well
                                ),
                                const SizedBox(height: 8),
                                const Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      metric['value'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          metric['unit'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Current Location section
                    const Text(
                      'Current Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Map placeholder (compatible with DartPad)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            // Simple grid pattern as map placeholder
                            CustomPaint(
                              size: Size(
                                  MediaQuery.of(context).size.width - 32, 180),
                              painter: MapPlaceholderPainter(),
                            ),
                            // Location indicator
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize
                                    .min, // Added to prevent overflow
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: darkBlue,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Text(
                                      'Central Park, New York',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // No incoming alerts
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'No incoming alerts!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // Updated bottom navigation bar as requested
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF242E49),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
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
                icon: Icon(Icons.person_2_outlined), label: "Profile")
          ]),
    );
  }
}

// Custom painter to create a map-like grid pattern
class MapPlaceholderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 1.0;

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += 20) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Draw vertical lines
    for (double x = 0; x < size.width; x += 20) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }

    // Draw some road-like elements
    final Paint roadPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 3.0;

    // Main roads
    canvas.drawLine(Offset(size.width * 0.2, 0),
        Offset(size.width * 0.2, size.height), roadPaint);
    canvas.drawLine(Offset(size.width * 0.6, 0),
        Offset(size.width * 0.6, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.3),
        Offset(size.width, size.height * 0.3), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.7),
        Offset(size.width, size.height * 0.7), roadPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}