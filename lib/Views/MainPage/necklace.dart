import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/theme/theme.dart';
import 'package:sgold/utils/constants/image_strings.dart';

class NecklaceProducts extends StatelessWidget {
  const NecklaceProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: <Widget>[
        Container(
          height: 50,
          // color: Colors.green,
          padding: EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('(4) Items'),
            GestureDetector(
              child: const Row(
                children: [Icon(Iconsax.sort), Text('Sort By')],
              ),
            )
          ]),
        ),
        Expanded(
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                  crossAxisCount: 2,
                  children: <Widget>[
                    // ProductContainer(
                    //     image: TImages.productImage3,
                    //     name: 'Nikey',
                    //     price: '20'),
                    // ProductContainer(
                    //     image: TImages.productImage3,
                    //     name: 'Nikey',
                    //     price: '20'),
                    // ProductContainer(
                    //     image: TImages.productImage3,
                    //     name: 'Nikey',
                    //     price: '20'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





