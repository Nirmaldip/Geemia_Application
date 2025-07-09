import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
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
                  // fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
             SizedBox(height: 5),

            /// SUBTITLE
            Text(
              data['subtitle']!,
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6),
                fontFamily: 'ArgentumSans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),

            /// BLACK DIVIDER LINE
            // Container(
            //   width: 50,
            //   height: 4,
            //   color: Colors.black,
            // ),
            // SizedBox(height: 20),

            /// PHONE IMAGE (you can replace with your frame image)
            Expanded(
              child: Stack(
                children: [
                  // Black belt image (slightly higher and more to right)
                  Positioned(
                    top: 70,
                    right: 200,
                    child: Image.asset(
                      'assets/images/black.png',
                       width:150,  // Increase width manually
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Orange curved belt image (below black and more right)
                  Positioned(
                    top: 280,
                    left: 230,
                    child: Image.asset(
                      'assets/images/orange.png',
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ),


                  // The phone mockup (centered)
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/address.png',
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Floating location icon (on top of phone)
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





            /// PAGE INDICATOR


            SizedBox(height: 30),

            /// REGISTER BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => EnterNameScreen()));
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Register", style: TextStyle(
                  fontFamily: 'ArgentumSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
            ),

            /// SIGN IN TEXT BUTTON
            TextButton(
              onPressed: () {},
              child: Text("Sign In",
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'ArgentumSans',
                      fontWeight: FontWeight.w400,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  /// PAGE INDICATOR WIDGET
  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4,
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
