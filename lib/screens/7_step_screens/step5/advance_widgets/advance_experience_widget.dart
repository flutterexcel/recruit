import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextField_centre.dart';

import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

class Adv_Exp extends StatefulWidget {
  @override
  State<Adv_Exp> createState() => _Adv_ExpState();
}

class _Adv_ExpState extends State<Adv_Exp> {
  String _selectedExperience;

  List<String> items = [
    'Less than 1 year',
    '1 year to 5 years',
    '5 years to 10 years',
    '10 years+',
    'Custome Experience Range',
  ];
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Contain(
      // width: MediaQuery.of(context).size.width,
      outlinecolor: AppColors.grey,
      borderrad: 4,
      child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
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
                      text: "Experience",
                      fweight: FontWeight.bold,
                    ),
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                  Textt(
                    text: " with a score",
                    tcolor: AppColors.grey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField_Int(
                        hintText: "5",
                        autocorrect: true,
                      ),
                    ),
                  ),
                  Textt(
                    text: " out of ",
                    tcolor: AppColors.grey,
                  ),
                  Textt(
                    text: "10",
                    tcolor: AppColors.grey,
                    fweight: FontWeight.bold,
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
                              text: "between",
                              tcolor: AppColors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 200,
                                height: 35,
                                child: Contain(
                                  outlinecolor: Colors.black,
                                  borderrad: 10,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedExperience = value;
                                      });
                                    },
                                    value: _selectedExperience,

                                    // Hide the default underline
                                    underline: SizedBox(),
                                    hint: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Select Experience',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ),

                                    isExpanded: true,

                                    // The list of options
                                    items: items
                                        .map((e) => DropdownMenuItem(
                                              child: Container(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              ),
                                              value: e,
                                            ))
                                        .toList(),

                                    // Customize the selected item
                                    selectedItemBuilder:
                                        (BuildContext context) => items
                                            .map((e) => Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey),
                                                  ),
                                                ))
                                            .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _selectedExperience
                                .toString()
                                .contains('Custome Experience Range')
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Textt(
                                        text: "between",
                                        tcolor: AppColors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: SizedBox(
                                          width: 50,
                                          height: 35,
                                          child: TextField_Centre(
                                            autocorrect: true,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Textt(
                                        text: "to",
                                        tcolor: AppColors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: SizedBox(
                                          width: 50,
                                          height: 35,
                                          child: TextField_Centre(
                                            autocorrect: true,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Textt(
                                        text: "years",
                                        tcolor: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Textt(
                                        text: "with a weightage of ",
                                        tcolor: AppColors.grey,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: 45,
                                        height: 30,
                                        child: TextField_Centre(
                                          autocorrect: true,
                                        ),
                                      ),
                                      Textt(
                                        text: "  of out ",
                                        tcolor: AppColors.grey,
                                      ),
                                      Textt(
                                        text: "10",
                                        fweight: FontWeight.bold,
                                        tcolor: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Textt(
                                        text: "add",
                                        tcolor: AppColors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: AppColors.orange12,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 2,
                              ),
                        if (_selectedExperience.toString().contains(items[0]) ||
                            _selectedExperience.toString().contains(items[1]) ||
                            _selectedExperience.toString().contains(items[2]) ||
                            _selectedExperience.toString().contains(items[3]))
                          Column(
                            children: [
                              Row(
                                children: [
                                  Textt(
                                    text: "with a weightage of ",
                                    tcolor: AppColors.grey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: 45,
                                    height: 30,
                                    child: TextField_Int(
                                      autocorrect: true,
                                    ),
                                  ),
                                  Textt(
                                    text: "  of out ",
                                    tcolor: AppColors.grey,
                                  ),
                                  Textt(
                                    text: "10",
                                    fweight: FontWeight.bold,
                                    tcolor: AppColors.grey,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Textt(
                                    text: "add",
                                    tcolor: AppColors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: AppColors.orange12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        else
                          const SizedBox(
                            height: 2,
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
