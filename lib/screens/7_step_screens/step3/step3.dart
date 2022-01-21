import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/confirm_dialouge.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Step3 extends StatefulWidget {
  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String b =
      'The subject which you put here, gets matched with source from income emails.\nSo you can put in some unique keyword which will be found in incoming email from candidate.\nThis will help us to automatically match that candidate to a job profile.\ne.g if your email from a job portal come as "python developer" your keyword should be "python".';

  String a =
      'You can also search subject using these operators like "+" and "|" . "+" allows you to search multiple words together and "|" allows you to match either one of the work\n\ne.g\na) php + mysql : this will match resumes having both php and mysql in their subject like \n\nb) email marketing | lead generation : this will match resumes having either email marketing or lead generation in their subject \n\nc) flutter | java : this will match subjects having either flutter or java in their subject. you can try out different combinations to setup your filter accordingly. ';

  TextEditingController tfController = TextEditingController();
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    void _popupDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: Confirm_Dialouge());
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        // drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: Colors.black,
                  borderrad: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textt(
                          text: "Source Matching",
                          size: 20,
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Step 3/7",
                          size: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                        Row(
                          children: [
                            Textt(
                              text: "Add ",
                              size: 13,
                            ),
                            Textt(
                              text: "Keyword ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "to match email from your inbox",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),

                        Row(
                          children: [
                            Textt(
                              text: "Candidate who ",
                              size: 13,
                            ),
                            Textt(
                              text: "email subject ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "matches this keyword",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),
                        Textt(
                          text: "automatically get assigned to the job profile",
                          size: 13,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Subject",
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: TextInput(
                                hintText: "Something unique Eg. python senior",
                                autocorrect: true,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  child: Transform.scale(
                                    scale: 1.6,
                                    child: Icon(
                                      Icons.info,
                                    ),
                                  ),
                                  onTap: () {},
                                )),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Visibility(
                          visible: isPressed ? true : false,
                          child: Contain(
                            // height: 315,
                            backcolor: AppColors.orange12,
                            outlinecolor: AppColors.grey,
                            borderrad: 2,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.close,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isPressed = false;
                                        });
                                      },
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 8.0),
                                  child: Text(a),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Contain(
                          height: 180,
                          backcolor: AppColors.purple,
                          outlinecolor: AppColors.grey,
                          borderrad: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(b),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Buttonn(
                              text: "Back",
                              bgcolor: AppColors.grey,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step2()));
                              },
                            ),
                            Buttonn(
                              text: "Next",
                              bgcolor: AppColors.blue,
                              borderRadius: 2,
                              onTap: () {
                                _popupDialog(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step4()));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
