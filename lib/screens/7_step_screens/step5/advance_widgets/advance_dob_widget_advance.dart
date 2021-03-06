import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

class AdvDob extends StatefulWidget {
  @override
  State<AdvDob> createState() => _AdvDobState();
}

class _AdvDobState extends State<AdvDob> {
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
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textt(
                          text: "Date Of",
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Birth",
                          fweight: FontWeight.bold,
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textt(
                        text: "with a",
                        tcolor: AppColors.grey,
                      ),
                      Textt(
                        text: "score",
                        tcolor: AppColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
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
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textt(
                        text: "out",
                        tcolor: AppColors.grey,
                      ),
                      Textt(
                        text: "of",
                        tcolor: AppColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
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
                                child: TextFieldInt(
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
                                child: TextFieldInt(
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
