// import 'package:flutter/material.dart';

// enum SortType { lowToHigh, highToLow, defaultType }

// class SortBy extends StatefulWidget {
//   @override
//   _SortByState createState() => _SortByState();
// }

// class _SortByState extends State<SortBy> {
//   SortType _selectedSortType = SortType.defaultType;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // You can handle onTap event if needed
//       },
//       child: Row(
//         children: [
//           Icon(Icons.sort),
//           SizedBox(width: 5), // Adding some space between icon and text
//           DropdownButton<SortType>(
//             value: _selectedSortType,
//             onChanged: ,
//             items: [
//               DropdownMenuItem(
//                 value: SortType.lowToHigh,
//                 child: Text('Weight: Low to High'),
//               ),
//               DropdownMenuItem(
//                 value: SortType.highToLow,
//                 child: Text('Weight: High to Low'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

