import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.weight,
    // required this.onPress,
  }) : super(key: key);

  final String image;
  final String name;
  final String weight;
  // final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    // var isFavourite = false;
    return SizedBox(
      width: 100,
      height: 100,
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
                  width : 50,
                  height : 10,
                  scale : 2,
                  image,
                  // fit: BoxFit.fitHeight,
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
                  "${weight}g",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
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
