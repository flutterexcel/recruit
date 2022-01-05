// import 'package:flutter/material.dart';

// class Dropdown extends StatefulWidget {
//   @override
//   State<Dropdown> createState() => _DropdownState();
// }

// class _DropdownState extends State<Dropdown> {
//   String selectedItem;
//   List<String> items;

//   _DropdownState({
//     this.selectedItem,
//     this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       onChanged: (value) {
//         setState(() {
//           selectedItem = value;
//         });
//       },
//       value: selectedItem,

//       // Hide the default underline
//       underline: SizedBox(),
//       hint: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           'Select Degree',
//           // textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 13, color: Colors.grey),
//         ),
//       ),

//       isExpanded: true,

//       // The list of options
//       items: items
//           .map((e) => DropdownMenuItem(
//                 child: Container(
//                   child: Text(
//                     e,
//                     style: TextStyle(fontSize: 13),
//                   ),
//                 ),
//                 value: e,
//               ))
//           .toList(),

//       // Customize the selected item
//       selectedItemBuilder: (BuildContext context) => items
//           .map((e) => Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   e,
//                   style: TextStyle(fontSize: 13, color: Colors.grey),
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }
