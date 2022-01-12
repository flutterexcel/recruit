import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/model/drop_down_model.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Step2 extends StatefulWidget {
  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  String dropdownvalue;
  //Future<DomainDropDown> futureAlbum;

  // ignore: deprecated_member_use
  List<dynamic> data = List();

  // ignore: missing_return
  Future<DomainDropDown> fetchDropdoen() async {
    final response = await http.get(Uri.parse(
        'https://aiapi-1.exweb.in/skill/domain_list?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTA3VDA5OjE2OjU5LjU1OVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxNTQ3MDE5LCJleHAiOjE2NzMwODMwMTl9.kW-6K1HFG7gNLGZC8RWdTrYiM2ft9qnZTh-kD-zfgv4&account-name=devrecruit'));

    if (response.statusCode == 200) {
      print("success");
      var resBody = json.decode(response.body);
      setState(() {
        data = resBody;
        print(data);
      });

      // return DomainDropDown.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchDropdoen();
    //  futureAlbum = DomainService1.fetchDropdoen();
  }
  // ignore: non_constant_identifier_names

  // var items = [
  //   'HR Recruitment',
  //   'Sales',
  //   'Education',
  //   'Accounts',
  //   'Customer Service',
  //   'Legal',
  //   'Marketing',
  //   'Others',
  //   'Software Development'
  // ];

  @override
  Widget build(BuildContext context) {
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
                  outlinecolor: AppColors.grey,
                  borderrad: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textt(
                          text: "Basic Information",
                          fweight: FontWeight.bold,
                          size: 20,
                        ),
                        Textt(
                          text: "Step 2/7",
                          size: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Textt(
                          text:
                              "Fill up the basic information regarding the job.",
                          size: 13,
                        ),
                        Row(
                          children: [
                            Textt(
                              text: "This will show up mainly on your public ",
                              size: 13,
                            ),
                            Textt(
                              text: "careers page",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Textt(text: "Name"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Contain(
                          width: MediaQuery.of(context).size.width,
                          outlinecolor: Colors.black,
                          borderrad: 10,
                          child: DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value;
                              });
                            },
                            value: dropdownvalue,

                            // Hide the default underline
                            underline: SizedBox(),
                            hint: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Select Domain',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),

                            isExpanded: true,

                            // The list of options
                            items: data
                                .map((e) => DropdownMenuItem<String>(
                                      child: Container(
                                        child: Text(
                                          e,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      value: e,
                                    ))
                                .toList(),

                            // Customize the selected item
                            selectedItemBuilder: (BuildContext context) => data
                                .map((e) => Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: "Job Title",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextInput(
                          autocorrect: true,
                          hintText: "Eg. PHP Developer",
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "Job Description",
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextInput(
                              hintText:
                                  "Eg. Job Brief, Responsibility, Skill Required",
                              maxLines: 6,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: "Candidate Profile",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextInput(
                          hintText: "Describe Candidate Skill set here...",
                          maxLines: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: "Number Of Openings",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField_Int(
                          hintText: "Number of openings",
                          autocorrect: true,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Buttonn(
                              text: "Back",
                              bgcolor: AppColors.grey,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step1()));
                              },
                            ),
                            Buttonn(
                              text: "Next",
                              bgcolor: AppColors.blue,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step3()));
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
