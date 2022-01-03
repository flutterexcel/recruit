import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Gender extends StatefulWidget {
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String _selectedGender;

  var items = [
    'Male',
    'Female',
  ];
  bool isPressed = false;

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
                  Textt(
                    text: "with ",
                    tcolor: AppColors.grey,
                  ),
                  InkWell(
                    child: Textt(
                      text: "Gender",
                      fweight: FontWeight.bold,
                    ),
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              isPressed
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Textt(
                              text: "as",
                              tcolor: AppColors.grey,
                            ),
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
                                        child: DropdownButton<String>(
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedGender = value;
                                            });
                                          },
                                          value: _selectedGender,

                                          // Hide the default underline
                                          underline: SizedBox(),
                                          hint: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Select Gender',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            ),
                                          ),

                                          isExpanded: true,

                                          // The list of options
                                          items: items
                                              .map((e) => DropdownMenuItem(
                                                    child: Container(
                                                      child: Text(
                                                        e,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                    value: e,
                                                  ))
                                              .toList(),

                                          // Customize the selected item
                                          selectedItemBuilder:
                                              (BuildContext context) => items
                                                  .map((e) => Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          e,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ))
                                                  .toList(),
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
                      ],
                    )
                  : const SizedBox(
                      height: 3,
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
