import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(
                child: Image.asset('assets/logo.png', height: 80),
              ),
              SizedBox(height: 50),

              Text("Email address", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Your Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),

              SizedBox(height: 30),
              Text("Password", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot password?"),
                ),
              ),

              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  // handle login
                },
                child: Center(child: Text("Continue", style: TextStyle(fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
