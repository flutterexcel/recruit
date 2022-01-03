import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Dob extends StatelessWidget {
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
                  Text("with "),
                  InkWell(
                    child: Textt(
                      text: "Date Of Birth",
                      fweight: FontWeight.bold,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("between"),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 50,
                      height: 35,
                      child: TextInput(
                      autocorrect: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("to"),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 50,
                      height: 35,
                      child: TextField(
                        //   controller: userNameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("years"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Textt(
                  text: "*dob should be in years",
                  size: 13,
                  tcolor: AppColors.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("add"),
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
                height: 30,
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
