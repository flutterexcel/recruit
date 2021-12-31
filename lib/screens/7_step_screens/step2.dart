import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class Step2 extends StatelessWidget {
  String dropdownvalue = 'HR Recruitment';
  var items = [
    'HR Recruitment',
    'Sales',
    'Education',
    'Accounts',
    'Customer Service',
    'Legal',
    'Marketing',
    'Others',
    'Software Development'
  ];

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
                      border: Border.all(color: Colors.grey),
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
                            "Basic Information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Step 2/7",
                            style: TextStyle(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Fill up the basic information regarding the job.",
                            style: TextStyle(fontSize: 13),
                          ),
                          Row(
                            children: const [
                              Text(
                                "This will show up mainly on your public ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "careers page",
                                style: TextStyle(
                                    fontSize: 13, color: AppColors.orange12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Name",
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: DropdownButton(
                              hint: Text("data"),
                              isExpanded: true,
                              underline: SizedBox(),
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(items),
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                // setState(() {
                                //   dropdownvalue = newValue;
                                // });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Job Title",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            //   controller: userNameController,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Eg. PHP Developer"),
                          ),
                          const SizedBox(height: 15),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Job Description",
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 6,
                                maxLength: null,
                                decoration: const InputDecoration(
                                  hintText:
                                      'Eg. Job Brief, Responsibility, Skill Required',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Candidate Profile",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            maxLength: null,
                            decoration: const InputDecoration(
                              hintText: 'Describe Candidate Skill set here...',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Number Of Openings",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            //   controller: userNameController,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Number of openings"),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
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
                                            builder: (context) => Step1()));
                                  },
                                ),
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.blue,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
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
