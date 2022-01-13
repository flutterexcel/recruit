import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/navigation.dart';

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

    void OnPressed() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Add_Source_C()));
    }

    return Scaffold(
        drawer: NavigationList(),
        appBar: SecondAppBar(
            text: "Add Source", title: "Manage Sources", onPressed: OnPressed));
  }
}