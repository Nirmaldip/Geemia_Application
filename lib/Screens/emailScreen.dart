import 'package:flutter/material.dart';
import 'package:geemia_app/utils/values/comm_dialogs.dart';
import 'package:provider/provider.dart';
import '../provider/api_call_provider.dart';
import 'otp_screen.dart';
import '../utils/comm_utils.dart';

class EmailEntryScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  EmailEntryScreen({super.key});

  void _onContinue(BuildContext context) async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      await CommDialogs.showCustomDialogBox(
        context: context,
        title: "Email Required",
        message: "Please enter your email address.",
        onOkPressed: () => Navigator.pop(context),
      );
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      await CommDialogs.showCustomDialogBox(
        context: context,
        title: "Invalid Email",
        message: "Please enter a valid email address.",
        onOkPressed: () => Navigator.pop(context),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.sendCode(context, email);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpScreen(email: email)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

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
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Create your account with your email address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextField(
                        controller: _emailController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Email",
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                        ),
                      ),
                      const SizedBox(height: 100),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'ArgentumSans',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          children: [
                            const TextSpan(
                                text: "By tapping 'Continue', you agree to our "),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            const TextSpan(text: ", "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  onPressed:
                  isLoading ? null : () => _onContinue(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8A05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text(
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
