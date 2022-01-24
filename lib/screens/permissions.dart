import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/permission/permisson.dart';
import 'package:flutter_product_recruit/services/permissions_services/permissions_service.dart';
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

  List<Datum> dataList = [];

  List<Configuration> configList = [];

  getData() async {
    var res = await PermissionService.GetPermission();

    setState(() {
      dataList = res.data;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Permissions"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: dataList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: dataList[index].configHeading,
                              size: 15,
                              fweight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            // height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    dataList[index].configurations.length,
                                itemBuilder: (BuildContext context, index2) {
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: Text(dataList[index]
                                              .configurations[index2]
                                              .title
                                              .toString())),
                                      Expanded(
                                        child: Switch(
                                          value: dataList[index]
                                              .configurations[index2]
                                                      .isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = !isSwitched;
                                            });
                                          },
                                          activeTrackColor:
                                              const Color(0xFF00E5FF),
                                          activeColor: const Color(0xFF00E5FF),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
