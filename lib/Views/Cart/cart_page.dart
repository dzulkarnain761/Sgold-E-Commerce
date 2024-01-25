import 'package:flutter/material.dart';
import 'package:sgold/Models/cart.dart';
import 'package:sgold/Models/product.dart';
import 'package:sgold/utils/constants/image_strings.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cart',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: Column(children: [
        Divider(height: 1, color: Colors.grey),
        Expanded(
          child: ListView.separated(
    padding: const EdgeInsets.all(15),
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return CartContainer(
                        image: TImages.productImage2,
                        name: 'Nikey',
                        price: '20g');
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      )]),
    );
  }
}


// Expanded(
//           child: CustomScrollView(
//             primary: false,
//             slivers: <Widget>[
//               SliverPadding(
//                 padding: const EdgeInsets.all(30),
//                 sliver: SliverGrid.count(
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 1,
//                   crossAxisCount: 1,
//                   children: <Widget>[
//                     CartContainer(
//                         image: TImages.productImage2,
//                         name: 'Nikey',
//                         price: '20g'),
//                     CartContainer(
//                         image: TImages.productImage2,
//                         name: 'Nikey',
//                         price: '20g'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),