// import 'package:flutter/material.dart';
// import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
// import 'package:flutter_product_recruit/widgets/navigation_list.dart';
// import 'package:flutter_product_recruit/widgets/second_app_bar..dart';

// import '../../app_colors.dart';

// class UserLogs extends StatefulWidget {
//   UserLogs();
//   @override
//   _UserLogsState createState() => _UserLogsState();
// }

// class _UserLogsState extends State<UserLogs> {
//   _UserLogsState();
//   @override
//   Widget build(BuildContext context) {
//     // print("manage source -${state}");

//     return Scaffold(
//       drawer: NavigationList(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: AppColors.Black),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           "User Logs",
//           style: TextStyle(color: AppColors.Black, fontSize: 23),
//           textAlign: TextAlign.left,
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         child: Column(
//           children: [
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 1,
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               itemBuilder: (BuildContext context, int index) {
//                 return _buildCarousel(context, index);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCarousel(BuildContext context, int carouselIndex) {
//     // return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         // Text('User Logs $carouselIndex'),
//         SizedBox(
//           // you may want to use an aspect ratio here for tablet support
//           height: MediaQuery.of(context).size.height / 1.3,
//           child: PageView.builder(
//             itemCount: 7,
//             // store this controller in a State to save the carousel scroll position
//             controller: PageController(viewportFraction: 0.8),
//             itemBuilder: (BuildContext context, int itemIndex) {
//               return _buildCarouselItem(context, carouselIndex, itemIndex);
//             },
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildCarouselItem(
//       BuildContext context, int carouselIndex, int itemIndex) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4.0),
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: AppColors.grey),
//             borderRadius: BorderRadius.circular(15)),
//         padding: EdgeInsets.only(top: 10),
//         child: Scrollbar(
//           thickness: 4,
//           isAlwaysShown: true,
//           child: SingleChildScrollView(
//             physics: ScrollPhysics(),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15),
//                         child: Text(
//                           'Monday',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 15),
//                         child: Text(
//                           '0:42',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ]),
//                 Container(
//                     padding: EdgeInsets.only(top: 25),
//                     child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: 8,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(left: 20),
//                                     width: 12,
//                                     height: 12,
//                                     decoration: BoxDecoration(
//                                         color: Color(0xFFFf6a609),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(80))),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(left: 20),
//                                     width: 2,
//                                     height: 70,
//                                     color: Color(0xFFFf6a609),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                   // mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       alignment: Alignment.topLeft,
//                                       margin: EdgeInsets.only(left: 20),
//                                       child: Text("11:22:11"),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(left: 20),
//                                       height: 70,
//                                       child: Text(
//                                         "tefst  Login Succesfully by test",
//                                         textAlign: TextAlign.justify,
//                                       ),
//                                     ),
//                                   ])
//                             ],
//                           );
//                         }))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
