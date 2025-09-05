import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/api_call_provider.dart';
import 'location_screen.dart';



class OtpScreen extends StatefulWidget {
  final String name;
  final String email;
  final String username;
  final String password;
  final String location;
  final String role;

  const OtpScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.location,
    required this.role,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _canResend = false;
  int _secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    _startResendCountdown(); // start countdown immediately
  }

  void _startResendCountdown() {
    setState(() {
      _canResend = false;
      _secondsRemaining = 30;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }


  /// ✅ Your Verify Button handler
  void _onVerifyPressed() async {
    final otpCode = _otpController.text.trim();
    print("OTP being sent to server: $otpCode"); // Debug log

    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit code")),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final isVerified = await authProvider.verifySignup(
      context,
      name: widget.name,
      email: widget.email,
      enterCode: otpCode,
      // ✅ was 'otp', now 'enterCode'
      username: widget.username,
      password: widget.password,
      location: widget.location,
      role: widget.role,
    );

    if (isVerified && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LocationAccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Incorrect OTP, please try again")),
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
          onPressed: () => Navigator.pop(context),
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
                  color: const Color(0xFFFF8A05),
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
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Enter the 6-digit code we have sent to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _otpController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      style: const TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 16,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "------",
                        hintStyle: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.black26,
                          letterSpacing: 16,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _canResend
                        ? GestureDetector(
                      onTap: _onResendCode,
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFF8A05),
                        ),
                      ),
                    )
                        : Text(
                      "Resend Code in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Change phone number',
                  style: TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFF8A05),
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
                  onPressed: _onVerifyPressed,
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



  // void _startResendCountdown() {
  //   _canResend = false;
  //   _secondsRemaining = 30;
  //
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (!mounted) {
  //       timer.cancel();
  //       return;
  //     }
  //
  //     setState(() {
  //       if (_secondsRemaining > 0) {
  //         _secondsRemaining--;
  //       } else {
  //         _canResend = true;
  //         timer.cancel();
  //       }
  //     });
  //   });
  // }

// The resend code function
  Future<void> _onResendCode() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      // Call sendCode with required parameters
      final success = await authProvider.sendCode(
        context,         // Pass context as first positional argument
        widget.email,    // Pass email as second positional argument
      );

      if (success) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP sent successfully")),
        );
        _startResendCountdown(); // restart timer
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to resend OTP: $e")),
      );
    }
  }



}
