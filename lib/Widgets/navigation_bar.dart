
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgold/Views/Cart/cart_page.dart';
import 'package:sgold/Views/main_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';


class Navbar extends StatelessWidget {
  Navbar({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            indicatorColor: TColors.secondary,
            indicatorShape: const CircleBorder(),
            shadowColor: Colors.black,
            backgroundColor: dark ? Colors.black : Colors.white,
            surfaceTintColor: dark ? Colors.black : Colors.white,
            height: 80,
            elevation: 10,
            // labelBehavior: ,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Iconsax.shopping_cart), label: "Cart"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
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
    const CartPage(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    )
  ];
}
