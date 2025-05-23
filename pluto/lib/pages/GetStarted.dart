import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: Stack(
        alignment: Alignment.center, // Centers all elements in Stack
        children: [
          // Background Image in the middle
          Align(
            alignment: Alignment.center, // Places image at the center
            child: Image.asset(
              "assets/freeform_background.png",
              width: 550,  // Adjust size as needed
              height: 550,
              fit: BoxFit.contain, // Keeps original aspect ratio
            ),
          ),

          // Column for text and button (on top of the image)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,  // Starts from top
            children: <Widget>[
              const SizedBox(height: 140), // Push content down
              // Row for Logo and Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,  // Centers horizontally
                children: [
                  Column(
                    children:[
                      const Text(
                        'Welcome to Pluto',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF242E49),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        "assets/pluto_logo1.png",
                        width: 240,  // Adjust size as needed
                        height: 240,
                        fit: BoxFit.contain, // Keeps original aspect ratio
                      ),
                      const SizedBox(width: 2),
                    ]
                  )

                ],
              ),

              const SizedBox(height: 80), // Space before the button

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');// Button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9EC8B9), // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ]
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
