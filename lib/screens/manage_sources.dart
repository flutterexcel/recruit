import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/second_navigation_list.dart';

class ManageSources extends StatefulWidget {
  ManageSources();
  @override
  _ManageSourcesState createState() => _ManageSourcesState();
}

class _ManageSourcesState extends State<ManageSources> {
  _ManageSourcesState();
  @override
  Widget build(BuildContext context) {
    // print("manage source -${state}");

    return Scaffold(
        drawer: SecondNavigationList(),
        appBar: SecondAppBar(text: "Add Source", title: "Manage Sources"));
  }
}
