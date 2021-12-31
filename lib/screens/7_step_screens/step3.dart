import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class Step3 extends StatelessWidget {
  String b =
      'The subject which you put here, gets matched with source from income emails.\nSo you can put in some unique keyword which will be found in incoming email from candidate.\nThis will help us to automatically match that candidate to a job profile.\ne.g if your email from a job portal come as "python developer" your keyword should be "python".';
  String a =
      'You can also search subject using these operators like "+" and "|" . "+" allows you to search multiple words together and "|" allows you to match either one of the work\n\ne.g\na) php + mysql : this will match resumes having both php and mysql in their subject like \n\nb) email marketing | lead generation : this will match resumes having either email marketing or lead generation in their subject \n\nc) flutter | java : this will match subjects having either flutter or java in their subject. you can try out different combinations to setup your filter accordingly. ';
  final TextEditingController tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 12.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Source Matching",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Step 3/7",
                            style: TextStyle(fontSize: 10),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                          Row(
                            children: const [
                              Text(
                                "Add ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "Keyword ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                              Text(
                                "to match email from your inbox",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Row(
                            children: const [
                              Text(
                                "Candidate who ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "email subject ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                              Text(
                                "matches this keyword",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Text(
                            "automatically get assigned to the job profile",
                            style: TextStyle(fontSize: 13),
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

                          TextField(
                            controller: tfController,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "something unique Eg. python senior"),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Container(
                            height: 315,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(a),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                            ),
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
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: FlatButton(
                                  child: const Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Step2()));
                                  },
                                ),
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.blue,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: FlatButton(
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Step3()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
