import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class EmptyJob extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        // drawer: NavigationList(),s
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Contain(
                  //   height: 180,
                  width: MediaQuery.of(context).size.width,
                  backcolor: AppColors.orange12,
                  outlinecolor: AppColors.grey,
                  borderrad: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "You have not added any source, you need add a source before you can continue. "),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Critical Error with Source"),
                                  Row(
                                    children: [
                                      Text("(click here to fix)"),
                                      Icon(Icons.notification_add),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Contain(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderrad: 5,
                  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Textt(
                          text: "No Job Profile. Add one to Proceed!",
                          size: 15,
                          tcolor: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
