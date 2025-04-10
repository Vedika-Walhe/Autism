import 'package:flutter/material.dart';
import 'package:pluto/database_helper.dart';

class SignUpScreenTherapist extends StatefulWidget {
  const SignUpScreenTherapist({super.key});

  @override
  _SignUpScreenTherapistState createState() => _SignUpScreenTherapistState();
}

class _SignUpScreenTherapistState extends State<SignUpScreenTherapist> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  String? errorText;
  bool isLoading = false;

  void registerUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    setState(() {
      errorText = null;
      isLoading = true;
    });

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorText = "All fields are required!";
        isLoading = false;
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        errorText = "Password must be at least 6 characters long!";
        isLoading = false;
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        errorText = "Passwords do not match!";
        isLoading = false;
      });
      return;
    }

    try {
      await dbHelper.registerTherapist(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful!")),
      );
      Navigator.pushReplacementNamed(context, '/login_therapist');
    } catch (e) {
      setState(() => errorText = "Email already exists! Try logging in.");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: "Email Address",
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      labelText: "Confirm Password",
                      errorText: errorText,
                    ),
                    obscureText: true,
                  ),
                  if (errorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        errorText!,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: registerUser,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: const Color(0xFF9EC8B9),
                          ),
                          child: const Text("Sign Up",
                              style: TextStyle(fontSize: 18, color: Colors.white)),
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
