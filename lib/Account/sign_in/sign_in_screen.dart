import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgold/Account/sign_in/sign_in_form.dart';
import 'package:sgold/Account/components/no_account_text.dart';
import 'package:sgold/Account/components/socal_cart.dart';
import 'package:sgold/Views/Profile/dark_mode_controller.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';



class SignInScreen extends StatelessWidget {
  

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        iconTheme: IconThemeData(
          color: dark ? Colors.white : Colors.black, // Set your desired color here
        ),
        
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  const SignForm(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/logos/google-icon.png",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/logos/facebook-icon.png",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


