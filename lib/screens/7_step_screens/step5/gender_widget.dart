import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Gender extends StatelessWidget {
  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return Contain(
      width: MediaQuery.of(context).size.width,
      outlinecolor: AppColors.grey,
      borderrad: 4,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("with "),
                  InkWell(
                    child: Textt(
                      text: "Gender",
                      fweight: FontWeight.bold,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("as"),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                            width: 250,
                            height: 35,
                            child: Contain(
                              outlinecolor: Colors.black,
                              borderrad: 10,
                              child: DropdownButton(
                                hint: Text("data"),
                                isExpanded: true,
                                underline: SizedBox(), //to hide the underline
                                value: dropdownvalue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(items),
                                      ));
                                }).toList(),
                                onChanged: (newValue) {
                                  // setState(() {
                                  //   dropdownvalue = newValue;
                                  // });
                                },
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Textt(
                text:
                    "*all score's are relative to 10 and will be normalized in final scoring",
                size: 10,
                tcolor: AppColors.grey,
              ),
            ],
          )),
    );
  }
}
