import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

// ignore: camel_case_types
class Adv_Skills extends StatefulWidget {
  @override
  State<Adv_Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Adv_Skills> {
  final _controller = TextEditingController();
  final _controllerNumber = TextEditingController();
  bool isPressed = false;
  bool isIconPressed = true;

  final List<String> names = <String>[];
  final List<String> number = <String>[];
  @override
  Widget build(BuildContext context) {
    return Contain(
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
                      text: "Skills",
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
                    text: "  out of ",
                    tcolor: AppColors.grey,
                  ),
                  Textt(
                    text: "10",
                    fweight: FontWeight.bold,
                    tcolor: AppColors.grey,
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
                                ? SizedBox(
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 9,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4),
                                      ),
                                      itemCount: names.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: Contain(
                                            borderrad: 20,
                                            outlinecolor: AppColors.grey,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          '${names[index]}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                InkWell(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                      child: isIconPressed
                                                          ? Text(
                                                              number[index]
                                                                      .isNotEmpty
                                                                  ? '${number[index]}'
                                                                  : 'NaN',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          : InkWell(
                                                              child: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              onTap: () {
                                                                setState(() {
                                                                  names.removeAt(
                                                                      index);
                                                                  isIconPressed =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .lightGrey),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      isIconPressed =
                                                          !isIconPressed;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
                                  )
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
                              text: "as",
                              tcolor: AppColors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 250,
                                height: 35,
                                child: TextInput(
                                  controller: _controller,
                                  autocorrect: true,
                                ),
                              ),
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
                                controller: _controllerNumber,
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
                            InkWell(
                              child: Icon(
                                Icons.add,
                                color: AppColors.orange12,
                              ),
                              onTap: () {
                                setState(() {
                                  names.insert(0, _controller.text);

                                  number.insert(
                                      0, _controllerNumber.text.toString());

                                  _controller.clear();
                                  _controllerNumber.clear();
                                });
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
