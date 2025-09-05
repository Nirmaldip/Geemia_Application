import 'package:flutter/material.dart';

import 'emailScreen.dart' show EmailEntryScreen;
import 'location_screen.dart' show LocationAccessScreen;
//
class CreatePasswordScreen extends StatefulWidget {
  final String email;
  final String otp;
  final String username;
  final String role;

  const CreatePasswordScreen({
  required this.email,
  required this.otp,
  required this.username,
    required this.role,
  Key? key,
  }) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

// class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
//   TextEditingController _passwordController = TextEditingController();
//   bool _isFilled = false;
//   bool _obscurePassword = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _passwordController.addListener(() {
//       setState(() {
//         _isFilled = _passwordController.text.isNotEmpty;
//       });
//     });
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
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: Image.asset(
//           'assets/images/title.png',
//           height: 40,
//         ),
//
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 40),
//                       Text(
//                         "Create a password",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         "Must be at least 8 characters",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black.withOpacity(0.5),
//                         ),
//                       ),
//                       SizedBox(height: 32),
//                       TextField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Your Password",
//                           hintStyle: TextStyle(
//                             fontFamily: 'ArgentumSans',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                             color: Colors.black.withOpacity(0.3),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey.withOpacity(0.1),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding:
//                           EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                               color: Colors.black.withOpacity(0.5),
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: Center(
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     'Your username is unique. You can always change it later',
//                     style: TextStyle(
//                       fontFamily: 'ArgentumSans',
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       color:Colors.black,
//                     ),
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
//                   onPressed: _isFilled ? () {
//                     Navigator.push(
//                       context,
//                       // MaterialPageRoute(builder: (context) => LocationAccessScreen()),
//                       MaterialPageRoute(builder: (context) => EmailEntryScreen(
//                           password: _passwordController.text.trim())),
//                     );
//                   } : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: _isFilled ? const Color(0xFFFF8A05) : Colors.black.withOpacity(0.3),
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

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  bool _isFilled = false;
  bool _obscurePassword = true;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _isFilled = _passwordController.text.isNotEmpty;
        _passwordError = null; // Reset error when typing
      });
    });
  }

  bool _validatePassword(String password) {
    if (password.length < 8) {
      setState(() {
        _passwordError = "Password must be at least 8 characters";
      });
      return false;
    }
    // Optional: add regex checks for uppercase, number, special character
    // final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    // if (!regex.hasMatch(password)) {
    //   setState(() {
    //     _passwordError = "Password must contain uppercase, number, and special character";
    //   });
    //   return false;
    // }
    return true;
  }

  void _onContinuePressed() {
    final password = _passwordController.text.trim();
    if (_validatePassword(password)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailEntryScreen(password: password),
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
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Image.asset('assets/images/title.png', height: 40),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Create a password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Must be at least 8 characters",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Password",
                          hintStyle: TextStyle(
                            fontFamily: 'ArgentumSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          errorText: _passwordError,
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
                child: const Text(
                  'Your username is unique. You can always change it later',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
                  onPressed: _isFilled ? _onContinuePressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _isFilled ? const Color(0xFFFF8A05) : Colors.black.withOpacity(0.3),
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
