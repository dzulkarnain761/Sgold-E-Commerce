import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sgold/Services/supabase.dart';
import 'package:sgold/Views/MainPage/productDetails.dart';
import 'package:sgold/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class NecklaceProduct extends StatefulWidget {
  const NecklaceProduct({Key? key}) : super(key: key);

  @override
  State<NecklaceProduct> createState() => _NecklaceProductState();
}

class _NecklaceProductState extends State<NecklaceProduct> {
  late Future<List<Map<String, dynamic>>> productData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    productData = _fetchProductData();
  }

  Future<List<Map<String, dynamic>>> _fetchProductData() async {
    try {
      return await DatabaseService().fetchNecklaceProducts();
    } catch (error) {
      print('Error fetching product data: $error');
      rethrow;
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
                // GestureDetector(
                //   onTap: ,
                //   child: const Row(
                //     children: [Icon(Iconsax.sort), Text('Sort By')],
                //   ),
                // )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              key: UniqueKey(), // Add a key to the FutureBuilder
              future: productData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                          CircularProgressIndicator(color: TColors.secondary));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final productList = products[index];
                      return GestureDetector(
                        onTap: () => Get.to(() => ProductDetails(
                              image: productList['image'],
                              title: productList['title'],
                              weight: productList['weight'].toString(),
                            )),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: productList['image'],
                                    placeholder: (context, url) => AspectRatio(
                                      aspectRatio: 1.3,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        enabled: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(productList['title']),
                              Text(
                                '${productList['weight'].toString()} g',
                                style: const TextStyle(color: Colors.green),
                              ),
                            ]),
                      );
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
