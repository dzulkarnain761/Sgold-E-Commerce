import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/utils/constants/colors.dart';

class ProductContainer extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductContainer(
      {required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          //Product Image
          Center(
            child: Image.network(
              image,
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              fit: BoxFit.fill,
            ),
          ),

          //Title name
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 11.0,
              ),
            ),
          ),

          //Price/weight number
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
          ),
          //add to cart button + heart icon
          const SizedBox(height: 7.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  height: 30,
                  width: 120,
                  color: TColors.secondary,
                  child: const Center(
                      child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 12),
                  )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Iconsax.heart,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
