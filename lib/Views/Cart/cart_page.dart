// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:sgold/Views/Cart/cart_card.dart';
// import 'package:sgold/Views/Cart/checkout_card.dart';
// import 'package:sgold/components/cart.dart';
// import 'package:sgold/utils/helpers/helper_functions.dart';



// class CartScreen extends StatefulWidget {
//   static String routeName = "/cart";

//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
  
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Column(
//             children: [
//               const Text(
//                 "Your Cart",
//                 style: TextStyle(color: Colors.white ),
//               ),
//               Text(
//                 "${demoCarts.length} items",
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView.builder(
//           itemCount: demoCarts.length,
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Dismissible(
//               key: Key(demoCarts[index].product.id.toString()),
//               direction: DismissDirection.endToStart,
//               onDismissed: (direction) {
//                 setState(() {
//                   demoCarts.removeAt(index);
//                 });
//               },
//               background: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFE6E6),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: const Row(
//                   children: [
//                     Spacer(),
//                     Icon(Iconsax.trash),
//                   ],
//                 ),
//               ),
//               child: CartCard(cart: demoCarts[index]),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: const CheckoutCard(),
//     );
//   }
// }
