import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Exp extends StatefulWidget {
  @override
  State<Exp> createState() => _ExpState();
}

class _ExpState extends State<Exp> {
  bool isIconPressed = true;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  List<String> items = [
    'Less than 1 year',
    '1 year to 5 years',
    '5 years to 10 years',
    '10 years+',
    'Custome Experience Range',
  ];
  bool isPressed = false;
  String _selectedExperience;
  List<String> number = <String>[];
  List<String> names = <String>[];

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
                      text: "Experience",
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
              isPressed
                  ? const SizedBox(
                      height: 1,
                    )
                  : const SizedBox(
                      height: 20,
                    ),
              isPressed
                  ? Column(
                      children: [
                        Column(
                          children: [
                            names.isEmpty
                                ? const SizedBox(
                                    height: 1,
                                  )
                                : const SizedBox(
                                    height: 15,
                                  ),
                            names.length > 0
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 30,
                                      );
                                    },
                                    itemCount: names.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Textt(
                                                      text: "between",
                                                      tcolor: AppColors.grey,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                    width: 150,
                                                    height: 35,
                                                    child: Contain(
                                                      borderrad: 1,
                                                      outlinecolor:
                                                          AppColors.grey,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: number.length > 0
                                                            ? Text('${names[index]} Years' +
                                                                ' to ' +
                                                                '${number[index]} Years')
                                                            : Text(
                                                                '${names[index]} years'),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Transform.scale(
                                                  scale: 0.7,
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  names.removeAt(index);
                                                  isIconPressed = true;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : const SizedBox(
                                    height: 20,
                                  ),
                          ],
                        ),
                        names.isEmpty
                            ? const SizedBox(
                                height: 1,
                              )
                            : const SizedBox(
                                height: 20,
                              ),
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
                                  outlinecolor: AppColors.grey,
                                  borderrad: 10,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedExperience = value;
                                      });
                                    },
                                    value: _selectedExperience,
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
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _selectedExperience.toString() ==
                                'Custome Experience Range'
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
                                          child: TextInput(
                                            controller: _controller,
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
                                          child: TextInput(
                                            controller: _controller2,
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
                                    height: 20,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 2,
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
                            InkWell(
                              child: Icon(
                                Icons.add,
                                color: AppColors.orange12,
                              ),
                              onTap: () {
                                if (_selectedExperience.toString() ==
                                        items[0] ||
                                    _selectedExperience.toString() ==
                                        items[1] ||
                                    _selectedExperience.toString() ==
                                        items[2] ||
                                    _selectedExperience.toString() ==
                                        items[3]) {
                                  print(_selectedExperience);
                                  names.insert(0, _selectedExperience);
                                  setState(() {});
                                } else if (_selectedExperience.toString() ==
                                    items[4]) {
                                  print(_selectedExperience.toString());
                                  names.add(_controller.text);
                                  number.add(_controller2.text);
                                  // names.insert(0, _controller.text);
                                  //  number.insert(0, _controller2.text);
                                  _controller.clear();
                                  _controller2.clear();
                                  setState(() {});
                                }
                              },
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
