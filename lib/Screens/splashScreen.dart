import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'enter_name_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Dynamic data to pass
  String userEmail = "user@example.com"; // Replace with real email from API or local storage
  String otpCode = "123456";             // Replace with real OTP from API or local storage

  @override
  void initState() {
    super.initState();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(
            email: userEmail,
            otpCode: otpCode,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  final String email;
  final String otpCode;

  const OnboardingScreen({Key? key, required this.email, required this.otpCode})
      : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "A Positive (Remote) Experience",
      "subtitle": "Complete Transparency & Possibilities From Anywhere.",
    },
    {
      "title": "Just a Taste Leads to More",
      "subtitle": "Discover, Connect, Unlock Endless Opportunities.",
    },
    {
      "title": "Move to the Top of the List",
      "subtitle": "Be Seen, Get Noticed, Connect Instantly.",
    },
    {
      "title": "No More Smoke",
      "subtitle": "Transparency and Trust - A New Era of Authenticity.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) =>
            buildOnboardingPage(onboardingData[index]),
      ),
    );
  }

  Widget buildOnboardingPage(Map<String, String> data) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            buildPageIndicator(),
            SizedBox(height: 30),
            Text(
              data['title']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.25,
                  fontFamily: 'ArgentumSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              data['subtitle']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.6),
                fontFamily: 'ArgentumSans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    right: 200,
                    child: Image.asset(
                      'assets/images/black.png',
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 280,
                    left: 230,
                    child: Image.asset(
                      'assets/images/orange.png',
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/address.png',
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 200,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            /// REGISTER BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterNameScreen(
                      email: widget.email,   // Dynamic email passed from Splash
                      otpCode: widget.otpCode, // Dynamic OTP passed from Splash
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Register",
                style: TextStyle(
                    fontFamily: 'ArgentumSans',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
            (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 70 : 70,
          height: 4,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.orange : Colors.grey[400],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
