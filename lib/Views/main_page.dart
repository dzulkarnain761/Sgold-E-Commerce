import 'package:flutter/material.dart';
import 'package:sgold/Views/MainPage/all_item.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/Views/MainPage/bracelet.dart';
import 'package:sgold/Views/MainPage/necklace.dart';
import 'package:sgold/Views/MainPage/ring.dart';
import 'package:sgold/utils/constants/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 4,
       child: Scaffold(
         appBar: AppBar(
           
           title: Center(child: Text('Main Page', style: TextStyle(fontFamily: 'Poppins'),)),
           bottom: const TabBar(
             isScrollable: false,
             indicatorSize: TabBarIndicatorSize.tab,
             indicatorColor: TColors.secondary,
             labelColor: TColors.secondary,
             automaticIndicatorColorAdjustment: false,
             labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 13),
             
             tabs:  [
               Tab(text: 'All'),
               Tab(text: 'Ring'),
               Tab(text: 'Necklace'),
               Tab(text: 'Bracelet'),
             ],
           ),
         ),
         body: const TabBarView(
           children: [
             // Add corresponding content for each tab
             AllProduct(),
             RingProducts(),
             NecklaceProducts(),
             BraceletProducts(),
           ],
         ),
       ),
     );
  }
}




