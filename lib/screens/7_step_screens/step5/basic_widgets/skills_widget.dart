import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Skills extends StatefulWidget {
  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  bool isPressed = false;
  final List<String> names = <String>[];
  final _controller = TextEditingController();
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
                      text: "Skills",
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
                                                          ? Text('    ')
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
