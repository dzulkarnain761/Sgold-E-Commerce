import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Account/sign_in/sign_in_screen.dart';
import 'package:sgold/Views/Profile/profile_menu.dart';
import 'package:sgold/Views/Profile/setting.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final link = const WhatsAppUnilink(
    phoneNumber: '601139197571',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  final location =
      "https://www.google.com/maps/place/Salwana+Kedai+Emas/@6.0465941,102.1442508,17z/data=!3m1!4b1!4m6!3m5!1s0x31b6a6902cfb028d:0x704412f00ec50674!8m2!3d6.0465888!4d102.1491217!16s%2Fg%2F11kn6q_rsf?entry=ttu";

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
            press: () => Get.to(() => const SettingPage())
          ),
          ProfileMenu(
            text: "Location",
            icon: Iconsax.location,
            press: () async => await launchUrlString(location),
          ),
          ProfileMenu(
            text: "Contact Us",
            icon: Iconsax.call,
            press: () async {
              await launchUrl(link.asUri());
            },
          ),
        ],
      ),
    );
  }
}
