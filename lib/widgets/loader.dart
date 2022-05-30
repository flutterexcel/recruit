import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Container(
      child: Center(child: CircularProgressIndicator(),),
      
    ),),
    );
  }
}