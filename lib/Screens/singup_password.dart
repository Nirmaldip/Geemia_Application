// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../model/user_data.dart';
// import '../provider/api_call_provider.dart';
//
//
//
// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60),
//               Center(
//                 child: Image.asset('assets/logo.png', height: 80),
//               ),
//               SizedBox(height: 50),
//
//               Text("Email address", style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: "Your Email",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//
//               SizedBox(height: 30),
//               Text("Password", style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text("Forgot password?"),
//                 ),
//               ),
//
//               SizedBox(height: 30),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//                 onPressed: () async {
//                   final email = emailController.text.trim();
//                   final password = passwordController.text.trim();
//
//                   if (email.isEmpty || password.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please enter email & password")),
//                     );
//                     return;
//                   }
//
//                   final userData = UserData(email: email, password: password);
//
//                   final authProvider =
//                   Provider.of<AuthProvider>(context, listen: false);


//
//                   bool success =
//                   await authProvider.authenticateUser(context, userData);
//
//                   if (!success) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Login failed, try again")),
//                     );
//                   }
//                 },
//                 child: Center(child: Text("Continue", style: TextStyle(fontSize: 18))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPasswordField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row with Logo center + Sign Up right
              Row(
                children: [
                   IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.orange),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // centerTitle: true,
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/title.png', // your logo path here
                        height: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>  LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF8A05),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Email or Password field based on state
              if (!showPasswordField) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email address",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ] else ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your password",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password logic
                    },
                    child: const Text("Forgot password?"),
                  ),
                ),
              ],

              const SizedBox(height: 30),

              // Continue button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  showPasswordField ? Colors.black : Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  if (!showPasswordField) {
                    // Step 1 → Show password field after email
                    setState(() {
                      showPasswordField = true;
                    });
                  } else {
                    // Step 2 → Call login API
                    // Replace with Provider authenticateUser
                    // Example:
                    // final authProvider = Provider.of<AuthProvider>(context, listen: false);
                    // await authProvider.authenticateUser(context, UserData(
                    //   email: emailController.text,
                    //   password: passwordController.text,
                    // ));
                  }
                },
                child: Center(
                  child: Text(
                    "Continue",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
