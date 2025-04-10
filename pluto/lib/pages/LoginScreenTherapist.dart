import 'package:flutter/material.dart';
import 'package:pluto/database_helper.dart';

class LoginScreenTherapist extends StatefulWidget {
  const LoginScreenTherapist({super.key});

  @override
  _LoginScreenTherapistState createState() => _LoginScreenTherapistState();
}

class _LoginScreenTherapistState extends State<LoginScreenTherapist> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  String? errorText;
  bool isLoading = false;

  void loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      errorText = null;
      isLoading = true;
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorText = "All fields are required!";
        isLoading = false;
      });
      return;
    }

    try {
      bool isAuthenticated = await dbHelper.loginTherapist(email, password);

      setState(() => isLoading = false);

      if (isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful!")),
        );
        Navigator.pushReplacementNamed(context, '/therapist_home_page');
      } else {
        setState(() => errorText = "Invalid email or password!");
      }
    } catch (e) {
      setState(() {
        errorText = "An error occurred. Please try again.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xFF092635),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 34,
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
                    if (errorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          errorText!,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 16),
                        ),
                      ),
                    const SizedBox(height: 20),
                    isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: loginUser,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: const Color(0xFF9EC8B9),
                            ),
                            child: const Text("Sign In",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, '/signup_therapist'),
                          child: const Text("Sign Up",
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
