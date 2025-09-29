// import 'package:flutter/material.dart';
// import 'package:geemia_app/Screens/Authentication/user_name.dart';
//
// class EnterNameScreen extends StatefulWidget {
//   // final String email;
//   // final String otpCode;
//
//   const EnterNameScreen({
//     super.key,
//     // required this.email,
//     // required this.otpCode,
//   });
//
//   @override
//   State<EnterNameScreen> createState() => _EnterNameScreenState();
// }
//
// class _EnterNameScreenState extends State<EnterNameScreen> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//
//   bool _isFilled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _firstNameController.addListener(_updateButtonState);
//     _lastNameController.addListener(_updateButtonState);
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       // ✅ firstname must not be empty, lastname can be null
//       _isFilled = _firstNameController.text.isNotEmpty;
//     });
//   }
//
//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),
//
//               // Top Logo + Login
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Center(
//                       child: Image.asset(
//                         'assets/images/title.png',
//                         height: 40,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context); // back to login
//                       },
//                       child: const Text(
//                         'Log In',
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFFFF8A05),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 40),
//
//               // Title
//               const Text(
//                 "Let's get started, what is your name?",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'ArgentumSans',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // First Name
//               TextField(
//                 controller: _firstNameController,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontFamily: 'ArgentumSans',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "First Name",
//                   hintStyle: TextStyle(
//                     fontFamily: 'ArgentumSans',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey.withOpacity(0.1),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: const BorderSide(
//                       color: Color(0xFFFF8A05),
//                       width: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Last Name (optional)
//               TextField(
//                 controller: _lastNameController,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontFamily: 'ArgentumSans',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Last Name (Optional)",
//                   hintStyle: TextStyle(
//                     fontFamily: 'ArgentumSans',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey.withOpacity(0.1),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: const BorderSide(
//                       color: Color(0xFFFF8A05),
//                       width: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const Spacer(),
//
//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isFilled
//                       ? () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => CreateUsernameScreen(
//                     //       firstname: _firstNameController.text.trim(),
//                     //       lastname: _lastNameController.text.trim().isEmpty
//                     //           ? null
//                     //           : _lastNameController.text.trim(),
//                     //       // email: widget.email,
//                     //       // otp: widget.otpCode,
//                     //     ),
//                     //   ),
//                     // );
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CreateUsernameScreen(
//                           firstname: _firstNameController.text.trim(),
//                           lastname: _lastNameController.text.trim().isEmpty
//                               ? "" // default to empty string
//                               : _lastNameController.text.trim(),
//                         ),
//                       ),
//                     );
//
//                   }
//                       : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: _isFilled
//                         ? const Color(0xFFFF8A05)
//                         : Colors.black.withOpacity(0.8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     "Continue",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/Authentication/singup_password.dart';
import 'package:geemia_app/Screens/Authentication/user_name.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_updateButtonState);
    _lastNameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isFilled = _firstNameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset('assets/images/title.png', height: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            // firstname: widget.firstname,
                            // lastname: widget.lastname,
                            // username: widget.username,
                            // role: widget.role,
                            // password: password,
                          ),
                        ),
                      ),
                      child: const Text(
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
              TextField(
                controller: _firstNameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'ArgentumSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFFFF8A05),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'ArgentumSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Last Name (Optional)",
                  hintStyle: TextStyle(
                    fontFamily: 'ArgentumSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFFFF8A05),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const Spacer(),
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
                          firstname: _firstNameController.text.trim(),
                          lastname: _lastNameController.text.trim(),
                        ),
                      ),
                    );
                  }
                      : null,
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
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
