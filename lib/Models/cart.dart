import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/utils/constants/colors.dart';

class CartContainer extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  CartContainer({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 100.0, // Adjust the width as needed
            height: 100.0, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.0),
          Column(children: [
            SizedBox(height: 30,),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 10,),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        
          //remove button
          
          Icon(Iconsax.activity)
          //select button
        ],
      ),
    );
  }
}
