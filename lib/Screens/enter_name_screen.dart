import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/singup_password.dart';
import 'package:geemia_app/Screens/user_name.dart';

import 'emailScreen.dart' show EmailEntryScreen;

class EnterNameScreen extends StatefulWidget {
  final String email;
  final String otpCode;
  const EnterNameScreen({super.key,required this.email,required this.otpCode});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _isFilled = _nameController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Top Logo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/title.png', // your logo path here
                        height: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFF8A05),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                "Let's get started, what is your name?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ArgentumSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // Name TextField
              TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'ArgentumSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Your Name",
                  hintStyle: TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),  // <-- fully rounded
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  // contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),  // <-- fully rounded
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),  // <-- fully rounded
                    borderSide: BorderSide(
                      color: Color(0xFFFF8A05),  // optional: add colored border when focused
                      width: 1.5,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 140),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child:
                // ElevatedButton(
                //   onPressed: _isFilled ? () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => EmailEntryScreen()),
                //     );
                //   } : null,
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: _isFilled ? const Color(0xFFFF8A05) : Colors.black.withOpacity(0.8),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //   ),
                //   child: const Text(
                //     'Continue',
                //     style: TextStyle(
                //       fontFamily: 'ArgentumSans',
                //       fontSize: 16,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isFilled
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateUsernameScreen(
                            email: widget.email,
                            otp: widget.otpCode,
                          ),
                        ),
                      );
                    }
                        : null, // Button disabled when _isFilled is false
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isFilled
                          ? const Color(0xFFFF8A05)
                          : Colors.black.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
