import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Blue Header
            Container(
              height: 180,
              decoration: const BoxDecoration(
                color: Color(0xFF092635),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Sign Up For Free!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Form Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password Confirmation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      errorText: errorText,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        errorText = passwordController.text == value ? null : "ERROR: Passwords do not match!";
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text == confirmPasswordController.text) {
                        Navigator.pushNamed(context, '/health_dashboard');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF9EC8B9),
                    ),
                    child: const Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text("Sign In", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
