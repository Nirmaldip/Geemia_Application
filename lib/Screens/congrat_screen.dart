import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geemia_app/Screens/dashboard.dart';
import 'package:geemia_app/provider/api_call_provider.dart';

class CongratsScreen extends StatefulWidget {
  final String name;
  final String email;
  final String enterCode;
  final String username;
  final String password;
  final String location;
  final String role;

  const CongratsScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.enterCode,
    required this.username,
    required this.password,
    required this.location,
    required this.role
  }) : super(key: key);

  @override
  _CongratsScreenState createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  bool _isSubmitting = false;

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);

    final apiProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await apiProvider.verifySignup(
      context,
      name: widget.name,
      email: widget.email,
      enterCode: widget.enterCode,
      username: widget.username,
      password: widget.password,
      location: widget.location,
      role:  widget.role,
    );

    setState(() => _isSubmitting = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Dashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png', height: 120),
              const SizedBox(height: 24),
              const Text(
                "Success!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 24),
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Go to Dashboard",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
