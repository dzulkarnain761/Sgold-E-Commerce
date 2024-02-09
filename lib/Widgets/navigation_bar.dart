
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgold/Views/Cart/cart_page.dart';
import 'package:sgold/Views/Profile/profile_page.dart';
import 'package:sgold/Views/main_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';


class Navbar extends StatelessWidget {
  static String routeName = "/forgot_password";
  Navbar({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    // final saiz = 
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          animationDuration: Duration(milliseconds: 0),
            indicatorColor: TColors.secondary,
            indicatorShape: const CircleBorder(),
            // shadowColor: Colors.black,
            backgroundColor: dark ? Color(0xFF272727) : Colors.white,
            surfaceTintColor: dark ? Color(0xFF272727) : Colors.white,
            height: 80,
            elevation: 10,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: controller.selectedIndex.value,
            
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home",selectedIcon: Icon(Iconsax.home, color: Colors.black),),
              // NavigationDestination(
              //     icon: Icon(Iconsax.shopping_cart), label: "Cart",selectedIcon: Icon(Iconsax.shopping_cart, color: Colors.black),),
              // NavigationDestination(
              //     icon: Icon(Iconsax.heart), label: "Wishlist",selectedIcon: Icon(Iconsax.heart, color: Colors.black),),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile",selectedIcon: Icon(Iconsax.user, color: Colors.black),),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const MainPage(),
    // const CartScreen(),
    // Container(
    //   color: Colors.yellow,
    // ),
    const ProfileScreen(),
  ];
}
