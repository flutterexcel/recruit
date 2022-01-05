import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextField_centre.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Dob extends StatefulWidget {
  @override
  State<Dob> createState() => _DobState();
}

class _DobState extends State<Dob> {
  bool isPressed = false;
  final List<String> names = <String>[];
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  final List<String> number = <String>[];
  bool isIconPressed = true;

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
                      text: "Date Of Birth",
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
                                                        child: Text(
                                                            '${names[index]}' +
                                                                ' to ' +
                                                                '${number[index]}'),
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
                                width: 50,
                                height: 35,
                                child: TextField_Centre(
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
                                child: TextField_Centre(
                                  controller: _controller2,
                                  autocorrect: true,
                                  borderRadius: 10,
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
                        Textt(
                          text: "*dob should be in years",
                          size: 13,
                          tcolor: AppColors.grey,
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
                                  number.insert(0, _controller2.text);

                                  _controller.clear();
                                  _controller2.clear();
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
                      height: 1,
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
