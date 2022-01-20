// import 'package:flutter/material.dart';

// class PopupMenuButtonScreen extends StatefulWidget {
//   @override
//   _PopupMenuButtonScreenState createState() => _PopupMenuButtonScreenState();
// }

// List<CustomPopupMenu> choices = <CustomPopupMenu>[
//   CustomPopupMenu(
//     title: 'Home',
//     icon: Icons.home,
//   ),
//   CustomPopupMenu(
//     title: 'Bookmarks',
//     icon: Icons.bookmark,
//   ),
//   CustomPopupMenu(
//     title: 'Settings',
//     icon: Icons.settings,
//   ),
// ];

// class _PopupMenuButtonScreenState extends State<PopupMenuButtonScreen> {
//   CustomPopupMenu _selectedChoices = choices[0];
//   void _select(CustomPopupMenu choice) {
//     setState(() {
//       _selectedChoices = choice;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popup Menu'),
//         actions: <Widget>[
//           PopupMenuButton<CustomPopupMenu>(
//             child: Icon(
//               Icons.more_vert,
//             ),
//             elevation: 3.2,
//             onCanceled: () {
//               print('You have not chossed anything');
//             },
//             tooltip: 'This is tooltip',
//             onSelected: _select,
//             itemBuilder: (BuildContext context) {
//               return choices.map((CustomPopupMenu choice) {
//                 return PopupMenuItem<CustomPopupMenu>(
//                   value: choice,
//                   child: Text(choice.title),
//                 );
//               }).toList();
//             },
//           )
//         ],
//       ),
//       body: bodyWidget(),
//     );
//   }

//   bodyWidget() {
//     return Container(
//       child: SelectedOption(choice: _selectedChoices),
//     );
//   }
// }

// class SelectedOption extends StatelessWidget {
//   final CustomPopupMenu choice;
//   SelectedOption({Key key, this.choice}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               choice.icon,
//               size: 80.0,
//               color: Colors.grey,
//             ),
//             Text(
//               choice.title,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomPopupMenu {
//   CustomPopupMenu({
//     this.title,
//     this.icon,
//   });
//   String title;
//   IconData icon;
// }
