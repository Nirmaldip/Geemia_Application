// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:geemia_app/Screens/dashboard.dart';
// import 'package:geemia_app/provider/api_call_provider.dart';
//
// class CongratsScreen extends StatefulWidget {
//   final String name;
//   final String email;
//   final String enterCode;
//   final String username;
//   final String password;
//   final String location;
//   final String role;
//
//   const CongratsScreen({
//     Key? key,
//     required this.name,
//     required this.email,
//     required this.enterCode,
//     required this.username,
//     required this.password,
//     required this.location,
//     required this.role,
//   }) : super(key: key);
//
//   @override
//   State<CongratsScreen> createState() => _CongratsScreenState();
// }
//
// class _CongratsScreenState extends State<CongratsScreen> {
//   bool _isSubmitting = false;
//
//   Future<void> _submit() async {
//     if (!mounted) return;
//     setState(() => _isSubmitting = true);
//
//     final apiProvider = Provider.of<AuthProvider>(context, listen: false);
//
//     final success = await apiProvider.verifySignup(
//       context,
//       name: widget.name,
//       email: widget.email,
//       enterCode: widget.enterCode,
//       username: widget.username,
//       password: widget.password,
//       location: widget.location,
//       role: widget.role,
//     );
//
//     if (!mounted) return;
//     setState(() => _isSubmitting = false);
//
//     if (success) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const Dashboard()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Verification failed. Please try again.")),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Automatically submit when screen opens
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _submit();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ✅ Success checkmark animation/image
//               Image.asset(
//                 'assets/images/success.png',
//                 height: 150,
//               ),
//               const SizedBox(height: 30),
//
//               const Text(
//                 "Congratulations!",
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.orange,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Your account has been verified successfully.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),
//               const SizedBox(height: 40),
//
//               _isSubmitting
//                   ? const CircularProgressIndicator(color: Colors.orange)
//                   : ElevatedButton(
//                 onPressed: _submit,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 50, vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   backgroundColor: Colors.orange,
//                 ),
//                 child: const Text(
//                   "Go to Dashboard",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/dashboard.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/success.png',
                height: 150,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your account has been verified successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Go to Dashboard",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

