import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextField_centre.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Adv_Skills extends StatefulWidget {
  @override
  State<Adv_Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Adv_Skills> {
  final _controller = TextEditingController();
  bool isPressed = false;

  final List<String> names = <String>[];
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
                      child: TextField_Centre(
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
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    names.length > 0
                                        ? SizedBox(
                                            // width: 110,
                                            height: 60,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              //  physics: NeverScrollableScrollPhysics(),
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                  width: 15,
                                                );
                                              },
                                              itemCount: names.length,
                                              itemBuilder: (context, index) {
                                                return Contain(
                                                  borderrad: 20,
                                                  //  height: 60,
                                                  width: 110,
                                                  outlinecolor: AppColors.grey,
                                                  child: ListTile(
                                                    title: Text(
                                                      '${names[index]}',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    trailing: InkWell(
                                                      child: Icon(Icons.close),
                                                      onTap: () {
                                                        setState(() {
                                                          names.removeAt(index);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                              shrinkWrap: true,
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 20,
                                          )
                                  ],
                                ),
                              ),
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

                                  _controller.clear();
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
