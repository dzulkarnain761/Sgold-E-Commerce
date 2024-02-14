import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgold/Views/Profile/dark_mode_controller.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final DarkModeController _controller = Get.put(DarkModeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        iconTheme: IconThemeData(
          color: dark ? Colors.white : Colors.black, // Set your desired color here
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode', style: TextStyle(fontSize: 16)),
                Obx(
                  () => Switch(
                    value: _controller.currentTheme.value == ThemeMode.dark,
                    onChanged: (value) {
                      _controller.switchTheme();
                      Get.changeThemeMode(_controller.currentTheme.value);
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade400,
                    trackOutlineColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Use device settings', style: TextStyle(fontSize: 16)),
                Obx(
                  () => Switch(
                    value: _controller.currentTheme.value == ThemeMode.system,
                    onChanged: (value) {
                      _controller.setSystemTheme();
                      Get.changeThemeMode(_controller.currentTheme.value);
                      
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade400,
                    trackOutlineColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
