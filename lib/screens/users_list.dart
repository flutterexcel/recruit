import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/add_new_user.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class User_List extends StatefulWidget {
  @override
  State<User_List> createState() => _User_ListState();
}

class _User_ListState extends State<User_List> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Users"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Icon(Icons.add, color: AppColors.white),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Add_New_User()));
                  },
                ),
              ),
                  ),
          ],
        ),
        // drawer: NavigationList(),s
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Contain(
                      outlinecolor: AppColors.grey,
                      borderrad: 8,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/def.png'),
                            radius: 25,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Textt(
                            text: "Jaswant",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Textt(
                            text: "jaswant@gmail.com",
                            tcolor: AppColors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Textt(
                            text: "Admin",
                            size: 13,
                            tcolor: AppColors.orange12,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Textt(
                                text: "21 jobs",
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Icon(isSwitched
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                                onTap: () {
                                  setState(() {
                                    isSwitched = !isSwitched;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          isSwitched
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 9,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            4),
                                  ),
                                  itemCount: 4,
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
                                                      'Ritik',
                                                      style: TextStyle(
                                                          color: Colors.black),
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
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.lightGrey),
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                )
                              : const SizedBox(
                                  height: 2,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.power_off,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.usb_off_rounded),
                              const SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.local_post_office),
                              const SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.open_with_outlined),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
