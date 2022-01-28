// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/services/profile/update_profile_service.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/get_userlist_service.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_product_recruit/bloc/profile_bloc/profile_bloc.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  UserProfileUpdate updateprofile = new UserProfileUpdate();

  _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog();
        });
  }

  bool isSwitched = false;
  bool firstswitch = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController sign = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  File _image;
  // AuthenticationService authenticationService = new AuthenticationService();
  // var name, email;

  // Future<UserModel> getuser() async {
  //   var h = await authenticationService.signInWithEmailAndPassword(
  //       StorageUtil.getUserEmail(), StorageUtil.getPassword());
  //   print("userdetail===${h.userDetails.name}");
  //   name = h.userDetails.name;
  //   email = h.userDetails.email;
  // }

  @override
  void initState() {
    nameController.text = StorageUtil.getUserName();
    emailController.text = StorageUtil.getUserEmail();
    phoneNumber.text = StorageUtil.getUserPhone();
    sign.text = StorageUtil.getUserSign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Scaffold(
          drawer: NavigationList(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.Black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "My Account",
              style: TextStyle(color: AppColors.Black, fontSize: 23),
              textAlign: TextAlign.left,
            ),
          ),
          // drawer: NavigationList(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 60),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = !isSwitched;
                              firstswitch = false;
                              isSwitched
                                  ? _popupDialog(context)
                                  : firstswitch == false
                                      ? _popupDialog(context)
                                      : Text("on");
                            });
                          },
                          activeTrackColor: const Color(0xFFffd740),
                          activeColor: const Color(0xFFffd740),
                        ),
                        Textt(
                          text: "Don't show quick message during shortlist",
                          size: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Textt(
                            text: "PERSONAL ",
                            size: 15,
                          ),
                          Textt(
                            text: "PROFILE ",
                            size: 15,
                            fweight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          chooseImage();

                          print("jj");
                        },
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.8,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.2),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: _image == null
                                            ? AssetImage(
                                                "assets/images/def.png",
                                              )
                                            : FileImage(_image))),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: AppColors.blue,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    // const CircleAvatar(
                    //   radius: 30,
                    //   backgroundColor: Colors.teal,
                    //   child: CircleAvatar(
                    //     backgroundImage: AssetImage('assets/images/def.png'),
                    //     radius: 38,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "name",
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextInput(
                            autocorrect: true,
                            controller: nameController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: phoneNumber,
                            maxLength: 10,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontFamily: 'RobotRegular',
                              ),
                              hintText: "Phone Number",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Phone number is required";
                              }
                            },
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: emailController,
                            enabled: false,
                            autocorrect: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: AppColors.veryLightGrey,
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Template Signature",
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: sign,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontFamily: 'RobotRegular',
                              ),
                              hintText: "Write your signature here ...",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    Buttonn(
                      text: "Save",
                      bgcolor: AppColors.Blue,
                      leftPadding: 15.0,
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          // print("validated");
                          // print("name--${nameController.text}");
                          // print("phone--${phoneNumber.text}");
                          // print("sign--${sign.text}");

                          // context.bloc<LoginBloc>().add(LoginWithEmail(
                          //     emailController.text, passwordController.text));

                          // context.bloc<ProfileBloc>().add(UpdateProfile(
                          //     nameController.text,
                          //     phoneNumber.text,
                          //     sign.text));

                          var p = await updateprofile
                              .userprofileUpdate(nameController.text,
                                  phoneNumber.text, sign.text)
                              .whenComplete(() async {
                            List<UserListsModel> res2 =
                                await GetUserListService.getUserList();
                            for (var i = 0; i < res2.length; i++) {
                              if (res2[i].email == StorageUtil.getUserEmail()) {
                                print(res2[i].name);
                                StorageUtil.setUserName(res2[i].name);
                                StorageUtil.setUserPhone(
                                    res2[i].phoneNo.toString());
                                StorageUtil.setUserSign(res2[i].signature);
                              }
                              setState(() {});
                            }
                          });
                          // Loader1(radius: 20.0, dotRadius: 6.0);
                          if (p.message != null) {
                            Utils.showSnackBar(
                                context, p.message, AppColors.pink);
                          }
                        }
                      },
                    ),
                  ]),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Textt(
                              text: "CHANGE ",
                              size: 15,
                            ),
                            Textt(
                              text: "PASSWORD",
                              size: 15,
                              fweight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Old Password",
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextInput(
                              controller: oldPassword,
                              hintText: "Old Password",
                              validateText: (value) {
                                if (value.isEmpty) {
                                  return "Old  Password is required";
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 9),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "New Password",
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextInput(
                                controller: newPassword,
                                hintText: "New Password",
                                validateText: (value) {
                                  if (value.isEmpty) {
                                    return "New  Password is required";
                                  }
                                }),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confirm Password",
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextInput(
                                controller: confirmPassword,
                                autocorrect: false,
                                hintText: "Confirm Password",
                                validateText: (value) {
                                  if (value.isEmpty) {
                                    return "Confirm  Password is required";
                                  }
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Buttonn(
                        text: "Save",
                        bgcolor: AppColors.Blue,
                        leftPadding: 15.0,
                        onTap: () async {
                          if (_formKey2.currentState.validate()) {}
                          var p = await updateprofile.changePassword(
                              confirmPassword.text,
                              newPassword.text,
                              oldPassword.text);

                          // Loader1(radius: 20.0, dotRadius: 6.0);
                          if (p.message != null) {
                            Utils.showSnackBar(
                                context, p.message, AppColors.pink);
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }

  alertDialog() {
    return AlertDialog(
      title: Text('Confirmation'),
      content: Text(
          'If you wants to reset this feature you can do it from my account page, click on yes to continue.'),
      actions: <Widget>[
        Transform.scale(
          scale: 0.9,
          child: new FlatButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
        ),
        Transform.scale(
          scale: 0.9,
          child: FlatButton(
            color: Color(0XFFf6a609),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ),
      ],
    );
  }

  chooseImage() async {
    //  ImagePicker imagePicker = ImagePicker();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // print("image-" + image.path);
//  _image = File(image.path);

    setState(() {
      _image = image;
      print(_image);
    });

    if (_image != null) {
      var res = await updateprofile.userProfileImage(_image);
      print(res.message);
      if (res.message != null) {
        Utils.showSnackBar(context, res.message, AppColors.pink);
      }
    }
  }
}
