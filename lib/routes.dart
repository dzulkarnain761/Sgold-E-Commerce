import 'package:flutter/material.dart';
import 'package:sgold/Account/forgot_password/forgot_password_screen.dart';
import 'package:sgold/Account/sign_in/sign_in_screen.dart';
import 'package:sgold/Account/sign_up/sign_up_screen.dart';
import 'package:sgold/Widgets/navigation_bar.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  Navbar.routeName: (context) =>  Navbar(),
};
