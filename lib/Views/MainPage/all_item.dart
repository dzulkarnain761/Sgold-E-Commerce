import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/Services/product_fromAPI.dart';
import 'package:sgold/Services/remote_service.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:sgold/utils/theme/theme.dart';
import 'package:sgold/utils/constants/image_strings.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
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

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('(4) Items'),
                GestureDetector(
                  child: const Row(
                    children: [Icon(Iconsax.sort), Text('Sort By')],
                  ),
                )
              ],
            ),
          ),
          isLoading ? const SizedBox(
                    height: 10.0,
                    width: 50.0,
                    child: Center(
                      child: CircularProgressIndicator(color: TColors.secondary)
                    ),
                  ) :
           Expanded(
                child: GridView.builder(
                  itemCount: products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 240,
                    // childAspectRatio: 1,
                  ),
                  itemBuilder: (_, index) => ProductContainer(
                    image: products![index].image,
                    name: products![index].title,
                    price: products![index].price.toString(),
                  ),
                ),
              ),
          
        ],
      ),
    );
  }
}
