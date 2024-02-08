import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/Models/product_card.dart';
import 'package:sgold/Services/product_fromAPI.dart';
import 'package:sgold/utils/constants/image_strings.dart';
import 'package:sgold/utils/helpers/helper_functions.dart';
import 'package:sgold/Services/supabase.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  late Future<List<Map<String, dynamic>>> productData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    productData = _fetchProductData();
  }

  Future<List<Map<String, dynamic>>> _fetchProductData() async {
    try {
      return await DatabaseService().readData();
    } catch (error) {
      // Handle error appropriately
      print('Error fetching product data: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: productData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      final products = snapshot.data!;
                      return Text('(${products.length}) Items');
                    }
                  },
                ),
                GestureDetector(
                  child: const Row(
                    children: [Icon(Iconsax.sort), Text('Sort By')],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              key: UniqueKey(), // Add a key to the FutureBuilder
              future: productData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,childAspectRatio: 0.85),
                    itemBuilder: (context, index) {
                      final productList = products[index];
                      return ProductContainer(
                          image: productList['image'],
                          name: productList['title'],
                          weight: '${productList['weight']}g');
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}



// isLoading ? const SizedBox(
//                     height: 10.0,
//                     width: 50.0,
//                     child: Center(
//                       child: CircularProgressIndicator(color: TColors.secondary)
//                     ),
//                   ) :
//            Expanded(
//                 child: GridView.builder(
//                   itemCount: products!.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 0,
//                     crossAxisSpacing: 0,
//                     mainAxisExtent: 240,
//                     // childAspectRatio: 1,
//                   ),
//                   itemBuilder: (_, index) => ProductContainer(
//                     image: products![index].image,
//                     name: products![index].title,
//                     price: products![index].price.toString(),
//                   ),
//                 ),
//               ),


