// import 'package:flutter/material.dart';
// import 'package:geemia_app/Screens/Authentication/password_screen.dart' show CreatePasswordScreen;
//
// class CreateUsernameScreen extends StatefulWidget {
//   // final String email;        // carried along if you still need it later
//   // final String otp;          // carried along if you still need it later
//   final String firstname;    // ✅ new
//   final String? lastname;    // ✅ new (optional)
//
//   const CreateUsernameScreen({
//     Key? key,
//     // required this.email,
//     // required this.otp,
//     required this.firstname,
//     this.lastname,
//   }) : super(key: key);
//
//   @override
//   _CreateUsernameScreenState createState() => _CreateUsernameScreenState();
// }
//
// class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   String? _selectedRole;
//   bool _isFilled = false;
//
//   final List<String> _roles = ["User", "Vendor", "Admin"];
//
//   @override
//   void initState() {
//     super.initState();
//     _usernameController.addListener(_updateButtonState);
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       _isFilled = _usernameController.text.isNotEmpty && _selectedRole != null;
//     });
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     super.dispose();
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
//                 style: TextStyle(
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
//                       "Choose your username",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       "This is how your name will appear in the app",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     TextField(
//                       controller: _usernameController,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontFamily: 'ArgentumSans',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                       ),
//                       decoration: InputDecoration(
//                         hintText: "Your Username",
//                         hintStyle: TextStyle(
//                           fontFamily: 'ArgentumSans',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,
//                           color: Colors.black.withOpacity(0.3),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.withOpacity(0.1),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     DropdownButtonFormField<String>(
//                       value: _selectedRole,
//                       items: _roles
//                           .map((role) => DropdownMenuItem<String>(
//                         value: role,
//                         child: Text(role),
//                       ))
//                           .toList(),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.withOpacity(0.1),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//                       ),
//                       hint: Text(
//                         "Select Role",
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(0.3),
//                           fontFamily: 'ArgentumSans',
//                         ),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedRole = value;
//                           _updateButtonState();
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Your username is unique. You can always change it later',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'ArgentumSans',
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFFFF8A05),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child:
//                 // ElevatedButton(
//                 //   onPressed: _isFilled
//                 //       ? () {
//                 //     Navigator.push(
//                 //       context,
//                 //
//                 //           MaterialPageRoute(
//                 //             builder: (context) => CreatePasswordScreen(
//                 //               firstname: widget.firstname.isEmpty ? "User" : widget.firstname, // fallback
//                 //               lastname: widget.lastname ?? "",
//                 //               username: _usernameController.text.trim(),
//                 //               role: _selectedRole!,
//                 //             ),
//                 //           ),
//                 //         );
//                 //
//                 //
//                 //
//                 //   }
//                 //       : null,
//                 //   style: ElevatedButton.styleFrom(
//                 //     backgroundColor: _isFilled
//                 //         ? const Color(0xFFFF8A05)
//                 //         : Colors.black.withOpacity(0.3),
//                 //     shape: RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(30),
//                 //     ),
//                 //   ),
//                 //   child: const Text(
//                 //     "Continue",
//                 //     style: TextStyle(
//                 //       fontFamily: 'ArgentumSans',
//                 //       fontSize: 16,
//                 //       fontWeight: FontWeight.w500,
//                 //       color: Colors.white,
//                 //     ),
//                 //   ),
//                 // ),
//                 ElevatedButton(
//                   onPressed: _isFilled
//                       ? () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CreatePasswordScreen(
//                           firstname: widget.firstname,
//                           lastname: widget.lastname ?? '', // already non-null
//                           username: _usernameController.text.trim(),
//                           role: _selectedRole!, // selected from dropdown
//                         ),
//                       ),
//                     );
//                   }
//                       : null,
//                   child: const Text("Continue"),
//                 )
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/Authentication/password_screen.dart';

class CreateUsernameScreen extends StatefulWidget {
  final String firstname;
  final String? lastname;

  const CreateUsernameScreen({
    Key? key,
    required this.firstname,
    this.lastname,
  }) : super(key: key);

  @override
  _CreateUsernameScreenState createState() => _CreateUsernameScreenState();
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String? _selectedRole;
  bool _isFilled = false;
  final List<String> _roles = ["User", "Vendor", "Admin"];

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      // button active only if username and role selected
      _isFilled = _usernameController.text.trim().isNotEmpty && _selectedRole != null;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
                      "Choose your username",
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
                      "This is how your name will appear in the app",
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
                      controller: _usernameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: "Your Username",
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
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      items: _roles
                          .map((role) => DropdownMenuItem<String>(
                        value: role.toLowerCase(),
                        child: Text(role),
                      ))
                          .toList(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                      hint: Text(
                        "Select Role",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontFamily: 'ArgentumSans',
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                          _updateButtonState();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isFilled
                      ? () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePasswordScreen(
                          firstname: widget.firstname,
                          lastname: widget.lastname ?? "",
                          username: _usernameController.text.trim(),
                          role: _selectedRole!,
                        ),
                      ),
                    );
                  }
                      : null,
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
