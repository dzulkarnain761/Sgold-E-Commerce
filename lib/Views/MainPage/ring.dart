import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/Models/product_card.dart';
import 'package:sgold/Services/product_fromAPI.dart';
import 'package:sgold/Services/remote_service.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/theme/theme.dart';
import 'package:sgold/utils/constants/image_strings.dart';

class RingProducts extends StatefulWidget {
  const RingProducts({super.key});

  @override
  State<RingProducts> createState() => _RingProductsState();
}

class _RingProductsState extends State<RingProducts> {
  List<ProductApi>? products;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      // Ensure that products is initialized before calling getProducts
      products = await RemoteService().getProducts();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle any potential errors during data fetching
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    var onPress;
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
        isLoading
            ? const SizedBox(
                height: 10.0,
                width: 50.0,
                child: Center(
                    child: CircularProgressIndicator(color: TColors.secondary)),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      products!.length,
                      (index) {
                        if (products!.length == products!.length) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProductCard(
                              image: products![index].image,
                              name: products![index].title,
                              price: products![index].price.toString(),
                            ),
                          );
                        }
                        return const SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              )
      ],
    );
  }
}
