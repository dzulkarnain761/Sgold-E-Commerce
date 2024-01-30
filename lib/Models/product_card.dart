import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.image,
    required this.name,
    required this.price,
    // required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final String image;
  final String name;
  final String price;
  // final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    var isFavourite = false;
    return SizedBox(
      width: width,
      child: GestureDetector(
        // onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: isFavourite ? Colors.red.shade300 : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.heart,
                      size: 15,
                      color: isFavourite
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
