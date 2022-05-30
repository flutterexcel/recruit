import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

class AdvEdu extends StatefulWidget {
  @override
  State<AdvEdu> createState() => _AdvEduState();
}

class _AdvEduState extends State<AdvEdu> {
  String _selectedDegree;
  String _selectedCourse;

  var items = [
    '10+2',
    'Diploma',
    'Bachlor',
    'Master',
    'Doctorate',
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
                      text: "Education",
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
                      child: TextFieldInt(
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
                    fweight: FontWeight.bold,
                    tcolor: AppColors.grey,
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
                                            _selectedDegree = value;
                                          });
                                        },
                                        value: _selectedDegree,

                                        // Hide the default underline
                                        underline: SizedBox(),
                                        hint: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Select Degree',
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
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("or"),
                                const SizedBox(
                                  height: 5,
                                ),
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
                                            _selectedCourse = value;
                                          });
                                        },
                                        value: _selectedCourse,

                                        // Hide the default underline
                                        underline: SizedBox(),
                                        hint: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Select Course',
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
                              child: TextFieldInt(
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
                          height: 15,
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
