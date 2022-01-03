import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextField_centre.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Adv_Location extends StatefulWidget {
  @override
  State<Adv_Location> createState() => _Adv_LocationState();
}

class _Adv_LocationState extends State<Adv_Location> {
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
                      text: "Location",
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
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 250,
                                height: 35,
                                child: TextField_Centre(
                                  autocorrect: true,
                                ),
                              ),
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
