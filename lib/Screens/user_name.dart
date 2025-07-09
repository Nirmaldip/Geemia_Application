import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/password_screen.dart' show CreatePasswordScreen;

class CreateUsernameScreen extends StatefulWidget {
  @override
  _CreateUsernameScreenState createState() => _CreateUsernameScreenState();
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  TextEditingController _usernameController = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _isFilled = _usernameController.text.isNotEmpty;
      });
    });
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/title.png',
          height: 40,
        ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Choose your username",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "This is how your name will appear in the app",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: _usernameController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Your username is unique. You can always change it later',
                      style: TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF8A05),
                      ),
                    ),
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
                  onPressed: _isFilled ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePasswordScreen()),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFilled ? const Color(0xFFFF8A05) : Colors.black.withOpacity(0.3),
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
