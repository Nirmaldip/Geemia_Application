// // import 'package:flutter/material.dart';
// // import 'emailScreen.dart';
// //
// // class CreatePasswordScreen extends StatefulWidget {
// //   final String firstname;
// //   final String? lastname; // optional, can be null
// //   final String username;
// //   final String role;
// //
// //   const CreatePasswordScreen(
// //
// //   {
// //
// //   super
// //
// //       .
// //
// //   key,
// //   required this.firstname,
// //   this.lastname, // optional
// //   required this.username,
// //   required this.role,
// // });
// //   @override
// //   State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
// // }
// //
// // class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
// //   final TextEditingController _passwordController = TextEditingController();
// //   bool _isFilled = false;
// //   bool _obscurePassword = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _passwordController.addListener(() {
// //       setState(() => _isFilled = _passwordController.text.isNotEmpty);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Create Password")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(24.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _passwordController,
// //               obscureText: _obscurePassword,
// //               decoration: InputDecoration(
// //                 hintText: "Password",
// //                 suffixIcon: IconButton(
// //                   icon: Icon(_obscurePassword
// //                       ? Icons.visibility_off
// //                       : Icons.visibility),
// //                   onPressed: () =>
// //                       setState(() => _obscurePassword = !_obscurePassword),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _isFilled
// //                   ? () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (_) => EmailEntryScreen(
// //
// //                         firstname: widget.firstname,
// //                         lastname: widget.lastname ?? "",
// //                         username: widget.username,
// //                         role: widget.role,
// //                         password: _passwordController.text.trim(),
// //                       ),
// //                     ),
// //
// //                 );
// //               }
// //                   : null,
// //               child: const Text("Continue"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'emailScreen.dart' show EmailEntryScreen;
//
// class CreatePasswordScreen extends StatefulWidget {
//   final String firstname;
//   final String lastname;
//   final String username;
//   final String role;
//
//   const CreatePasswordScreen({
//     required this.firstname,
//     required this.lastname,
//     required this.username,
//     required this.role,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
// }
//
// class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
//   TextEditingController _passwordController = TextEditingController();
//   bool _isFilled = false;
//   bool _obscurePassword = true;
//   String? _passwordError;
//
//   @override
//   void initState() {
//     super.initState();
//     _passwordController.addListener(() {
//       setState(() {
//         _isFilled = _passwordController.text.isNotEmpty;
//         _passwordError = null; // Reset error when typing
//       });
//     });
//   }
//
//   bool _validatePassword(String password) {
//     if (password.length < 8) {
//       setState(() {
//         _passwordError = "Password must be at least 8 characters";
//       });
//       return false;
//     }
//     return true;
//   }
//
//   // void _onContinuePressed() {
//   //   final password = _passwordController.text.trim();
//   //   if (_validatePassword(password)) {
//   //     // Pass all required fields to EmailEntryScreen
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => EmailEntryScreen(
//   //           firstname: widget.firstname,
//   //           lastname: widget.lastname,
//   //           // email: widget.email,
//   //           // otp: widget.otp,
//   //           username: widget.username,
//   //           role: widget.role,
//   //           password: password,
//   //         ),
//   //       ),
//   //     );
//   //   }
//   // }
//
//   void _onContinuePressed() {
//     final password = _passwordController.text.trim();
//     if (_validatePassword(password)) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EmailEntryScreen(
//             firstname: widget.firstname,
//             lastname: widget.lastname, // always non-null
//             username: widget.username,
//             role: widget.role,
//             password: password,
//           ),
//         ),
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
//                       const SizedBox(height: 40),
//                       const Text(
//                         "Create a password",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         "Must be at least 8 characters",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black54,
//                         ),
//                       ),
//                       const SizedBox(height: 32),
//                       TextField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
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
//                           const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
//                           errorText: _passwordError,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const Center(
//               child: Padding(
//                 padding: EdgeInsets.only(right: 16),
//                 child: Text(
//                   'Your username is unique. You can always change it later',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'ArgentumSans',
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
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
//                   onPressed: _isFilled ? _onContinuePressed : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                     _isFilled ? const Color(0xFFFF8A05) : Colors.black.withOpacity(0.3),
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




import 'package:flutter/material.dart';
import 'emailScreen.dart' show EmailEntryScreen;

class CreatePasswordScreen extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String username;
  final String role;

  const CreatePasswordScreen({
    Key? key,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.role,
  }) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isFilled = false;
  bool _obscurePassword = true;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _isFilled = _passwordController.text.isNotEmpty;
        _passwordError = null; // Reset error while typing
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
    return true;
  }

  void _onContinuePressed() {
    final password = _passwordController.text.trim();
    if (_validatePassword(password)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailEntryScreen(
            firstname: widget.firstname,
            lastname: widget.lastname,
            username: widget.username,
            role: widget.role,
            password: password,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
            const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
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
