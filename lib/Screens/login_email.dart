// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:geemia_app/utils/values/colors.dart';
//
// import '../utils/comm_widget.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//
//   Future<void> authenticateUser() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() => _isLoading = true);
//
//     try {
//       final response = await http.post(
//         Uri.parse("http://127.0.0.1:8000/api/login"),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "email": _emailController.text.trim(),
//           "password": _passwordController.text.trim(),
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//
//         if (data["success"] == true) {
//           // Save token if provided
//           final prefs = await shar.getInstance();
//           await prefs.setString("token", data["token"] ?? "");
//
//           CommWidget.showColorToast("Login successful",primaryColor);
//           Navigator.pushReplacementNamed(context, "/home");
//         } else {
//           CommWidget.showColorToast("Invalid credentials",primaryColor);
//         }
//       } else {
//         CommWidget.showColorToast("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       CommWidget.showDarkToast("Login failed: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Email address",
//                   style: TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 12),
//                 TextFormField(
//                   controller: _emailController,
//                   validator: (val) =>
//                   val == null || val.isEmpty ? "Enter email" : null,
//                   decoration: InputDecoration(
//                     hintText: "Your Email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Password",
//                   style: TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 12),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   validator: (val) =>
//                   val == null || val.isEmpty ? "Enter password" : null,
//                   decoration: InputDecoration(
//                     hintText: "Your Password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Center(
//                   child: _isLoading
//                       ? const CircularProgressIndicator()
//                       : ElevatedButton(
//                     onPressed: authenticateUser,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 80, vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Continue",
//                       style: TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
