import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Permis extends StatefulWidget {
  @override
  State<Permis> createState() => _PermisState();
}

class _PermisState extends State<Permis> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  bool isSwitched6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Permissions"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Textt(
                    text: "Source Permissions",
                    size: 15,
                    fweight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("HR can add a source")),
                        Expanded(
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("HR can update a source")),
                        Expanded(
                          child: Switch(
                            value: isSwitched1,
                            onChanged: (value) {
                              setState(() {
                                isSwitched1 = !isSwitched1;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text("HR can activate/deactivate source")),
                        Expanded(
                          child: Switch(
                            value: isSwitched2,
                            onChanged: (value) {
                              setState(() {
                                isSwitched2 = !isSwitched2;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("HR can delete a source")),
                        Expanded(
                          child: Switch(
                            value: isSwitched3,
                            onChanged: (value) {
                              setState(() {
                                isSwitched3 = !isSwitched3;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Textt(
                        text: "Job Permissions",
                        size: 15,
                        fweight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("HR can delete a job")),
                        Expanded(
                          child: Switch(
                            value: isSwitched4,
                            onChanged: (value) {
                              setState(() {
                                isSwitched4 = !isSwitched4;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("HR can add a job")),
                        Expanded(
                          child: Switch(
                            value: isSwitched5,
                            onChanged: (value) {
                              setState(() {
                                isSwitched5 = !isSwitched5;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Textt(
                        text: "Referral Permissions",
                        size: 15,
                        fweight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("HR can view referral")),
                        Expanded(
                          child: Switch(
                            value: isSwitched6,
                            onChanged: (value) {
                              setState(() {
                                isSwitched6 = !isSwitched6;
                              });
                            },
                            activeTrackColor: const Color(0xFF00E5FF),
                            activeColor: const Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
