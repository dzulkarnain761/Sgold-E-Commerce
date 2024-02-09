// import 'package:flutter/material.dart';
// import 'package:sgold/components/cart.dart';
// import 'package:sgold/utils/helpers/helper_functions.dart';



// class CartCard extends StatefulWidget {
//   const CartCard({
//     Key? key,
//     required this.cart,
//   }) : super(key: key);

//   final Cart cart;

//   @override
//   State<CartCard> createState() => _CartCardState();
// }

// class _CartCardState extends State<CartCard> {
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Image.asset(widget.cart.product.images[0]),
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.cart.product.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//               maxLines: 2,
//             ),
//             const SizedBox(height: 8),
//             Text.rich(
//               TextSpan(
//                 text: "\$${widget.cart.product.price}",
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w600, color: Colors.orange),
//                 children: [
//                   TextSpan(
//                       text: " x${widget.cart.numOfItem}",
//                       style: Theme.of(context).textTheme.bodyLarge),
//                 ],
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
