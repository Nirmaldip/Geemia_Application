import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/user_name.dart';
import 'package:provider/provider.dart';

import '../model/verify_otp_request.dart';
import '../provider/api_call_provider.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({required this.email, Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();

  void _onVerifyPressed() async {
    final otpCode = _otpController.text.trim();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.verifyOtp(
      context: context,
      email: widget.email,
      otp: otpCode,
    );

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  CreateUsernameScreen(email: widget.email,otp: otpCode,),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset('assets/images/title.png', height: 40),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 48,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Enter the 4-digit code we have sent to your email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: _otpController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          letterSpacing: 16,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "----",
                          hintStyle: TextStyle(
                            fontFamily: 'ArgentumSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Colors.black.withOpacity(0.3),
                            letterSpacing: 16,
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Resend Code in 00:30",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Change phone number',
                    style: TextStyle(
                      fontFamily: 'ArgentumSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF8A05),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    final otpCode = _otpController.text.trim();

                    final authProvider = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );

                    final isVerified = await authProvider.verifyOtp(
                      context: context,
                      email: widget.email,
                      otp: otpCode,
                    );

                    if (isVerified) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CreateUsernameScreen(email: widget.email,otp: otpCode,),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8A05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: 'ArgentumSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
