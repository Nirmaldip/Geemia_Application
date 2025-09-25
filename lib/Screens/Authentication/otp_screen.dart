// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../provider/api_call_provider.dart';
// import 'congrat_screen.dart';
//
// class OtpScreen extends StatefulWidget {
//   final String firstname;
//   final String lastname;
//   final String email;
//   final String username;
//   final String password;
//   final String role;
//
//   const OtpScreen({
//     Key? key,
//     this.firstname = "",
//     this.lastname = "",
//     this.email = "",
//     this.username = "",
//     this.password = "",
//     this.role = "user",
//   }) : super(key: key);
//
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   bool _canResend = false;
//   int _secondsRemaining = 30;
//
//   @override
//   void initState() {
//     super.initState();
//     _startResendCountdown();
//   }
//
//   void _startResendCountdown() {
//     setState(() {
//       _canResend = false;
//       _secondsRemaining = 30;
//     });
//
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (!mounted) {
//         timer.cancel();
//         return;
//       }
//       setState(() {
//         if (_secondsRemaining > 0) {
//           _secondsRemaining--;
//         } else {
//           _canResend = true;
//           timer.cancel();
//         }
//       });
//     });
//   }
//
//   /// ✅ Verify Button handler
//   // void _onVerifyPressed() async {
//   //   final otpCode = _otpController.text.trim();
//   //   if (otpCode.length != 6) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text("Please enter a valid 6-digit code")),
//   //     );
//   //     return;
//   //   }
//   //
//   //   final apiProvider = Provider.of<AuthProvider>(context, listen: false);
//   //   final isVerified = await apiProvider.verifySignup(
//   //     context,
//   //     firstname: widget.firstname,
//   //     lastname: widget.lastname,
//   //     email: widget.email,
//   //     username: widget.username,
//   //     password: widget.password,
//   //     role: widget.role,
//   //     enterCode: otpCode,
//   //   );
//   //
//   //   if (isVerified && mounted) {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => CongratsScreen(
//   //           // firstname: widget.firstname,
//   //           // lastname: widget.lastname,
//   //           // email: widget.email,
//   //           // username: widget.username,
//   //           // password: widget.password,
//   //           // role: widget.role,
//   //           // enterCode: otpCode,
//   //         ),
//   //       ),
//   //     );
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text("Incorrect OTP, please try again")),
//   //     );
//   //   }
//   // }
//
//   void _onVerifyPressed() async {
//     final otpCode = _otpController.text.trim();
//     if (otpCode.length != 6) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter a valid 6-digit code")),
//       );
//       return;
//     }
//
//     final apiProvider = Provider.of<AuthProvider>(context, listen: false);
//     final isVerified = await apiProvider.verifySignup(
//       context,
//       firstname: widget.firstname.isNotEmpty ? widget.firstname : "",
//       lastname: widget.lastname.isNotEmpty ? widget.lastname : "",
//       email: widget.email.isNotEmpty ? widget.email : "",
//       username: widget.username.isNotEmpty ? widget.username : "",
//       password: widget.password.isNotEmpty ? widget.password : "",
//       role: widget.role.isNotEmpty ? widget.role : "user", // default role if empty
//       enterCode: otpCode,
//     );
//
//     if (isVerified && mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CongratsScreen(
//             // You can also pass all values here if needed
//           ),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Incorrect OTP, please try again")),
//       );
//     }
//   }
//
//   /// ✅ Resend Code
//   Future<void> _onResendCode() async {
//     final apiProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       final success = await apiProvider.sendCode(context, widget.email);
//       if (success) {
//         if (!mounted) return;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("OTP sent successfully")),
//         );
//         _startResendCountdown();
//       }
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to resend OTP: $e")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         centerTitle: true,
//         title: Image.asset('assets/images/title.png', height: 40),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: Center(
//               child: Text(
//                 'Log In',
//                 style: const TextStyle(
//                   fontFamily: 'ArgentumSans',
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFFFF8A05),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 40),
//                     const Text(
//                       "Enter the 6-digit code we have sent to your email",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     TextField(
//                       controller: _otpController,
//                       textAlign: TextAlign.center,
//                       keyboardType: TextInputType.number,
//                       maxLength: 6,
//                       style: const TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 24,
//                         letterSpacing: 16,
//                       ),
//                       decoration: InputDecoration(
//                         counterText: "",
//                         hintText: "------",
//                         hintStyle: const TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 24,
//                           color: Colors.black26,
//                           letterSpacing: 16,
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.withOpacity(0.1),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(16),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                           vertical: 24,
//                           horizontal: 24,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     _canResend
//                         ? GestureDetector(
//                       onTap: _onResendCode,
//                       child: const Text(
//                         "Resend Code",
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFFFF8A05),
//                         ),
//                       ),
//                     )
//                         : Text(
//                       "Resend Code in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
//                       style: const TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 16, bottom: 16),
//               child: Center(
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   'Change phone number',
//                   style: const TextStyle(
//                     fontFamily: 'ArgentumSans',
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFFFF8A05),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: _onVerifyPressed,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF8A05),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     "Continue",
//                     style: TextStyle(
//                       fontFamily: 'ArgentumSans',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/verify_otp_request.dart';
import '../../provider/api_call_provider.dart';
import 'congrat_screen.dart';

class OtpScreen extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String password;
  final String role;

  const OtpScreen({
    Key? key,
    this.firstname = "",
    this.lastname = "",
    this.email = "",
    this.username = "",
    this.password = "",
    this.role = "user",
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _canResend = false;
  int _secondsRemaining = 90;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  void _startResendCountdown() {
    setState(() {
      _canResend = false;
      _secondsRemaining = 90;
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

  void _onVerifyPressed() async {
    final otpCode = _otpController.text.trim();
    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit code")),
      );
      return;
    }

    final verifyRequest = VerifyOtpRequest(
      firstname: widget.firstname,  // must NOT be empty
      lastname: widget.lastname,    // must NOT be empty
      email: widget.email,
      username: widget.username,    // must NOT be empty
      password: widget.password,    // must NOT be empty
      role: widget.role.isNotEmpty ? widget.role : "user",
      enterCode: otpCode,
    );

    final apiProvider = Provider.of<AuthProvider>(context, listen: false);
    final isVerified = await apiProvider.verifySignup(context, verifyRequest);

    if (isVerified && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CongratsScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Incorrect OTP, please try again")),
      );
    }
  }

  Future<void> _onResendCode() async {
    final apiProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      final success = await apiProvider.sendCode(context, widget.email);
      if (success) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP sent successfully")),
        );
        _startResendCountdown();
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to resend OTP: $e")),
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
                style: const TextStyle(
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
                        hintStyle: const TextStyle(
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
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 24,
                        ),
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
                  style: const TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFF8A05),
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
}

