import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Location extends StatelessWidget {
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
                      text: "Location",
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
                  Text("as"),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 250,
                      height: 35,
                      child: TextInput(
                        autocorrect: true,
                      ),
                    ),
                  ),
                ],
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
                height: 20,
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
