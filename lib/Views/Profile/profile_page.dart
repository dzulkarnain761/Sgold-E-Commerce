import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Account/sign_in/sign_in_screen.dart';
import 'package:sgold/Views/Profile/profile_menu.dart';

import 'package:sgold/routes.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Iconsax.user,
            press: () => Get.to(() => const SignInScreen()),
          ),
          
          ProfileMenu(
            text: "Settings",
            icon: Iconsax.setting,
            press: () {},
          ),
          ProfileMenu(
            text: "Location",
            icon: Iconsax.location,
            press: () {},
          ),
          ProfileMenu(
            text: "Contact Us",
            icon: Iconsax.call,
            press: () {},
          ),
        ],
      ),
    );
  }
}
