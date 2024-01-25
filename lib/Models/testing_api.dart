import 'package:flutter/material.dart';
import 'package:sgold/Services/product_fromAPI.dart';
import 'package:sgold/Services/remote_service.dart';

class TestingAPI extends StatefulWidget {
  const TestingAPI({super.key});

  @override
  State<TestingAPI> createState() => _TestingAPIState();
}

class _TestingAPIState extends State<TestingAPI> {
  List<ProductApi>? products;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    // Ensure that products is initialized before calling getProducts
    products = await RemoteService().getProducts();
    // Trigger a rebuild after data is fetched
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestingAPI'),
      ),
      body: buildProductList(),
    );
  }

  Widget buildProductList() {
    if (products == null) {
      // Handle the case where products is still null (data not loaded yet)
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (products!.isEmpty) {
      // Handle the case where products is an empty list
      return const Center(
        child: Text('No products available.'),
      );
    } else {
      // Build the ListView using products
      return ListView.builder(
        itemCount: products!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(products![index].image),
          );
        },
      );
    }
  }
}
