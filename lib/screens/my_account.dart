// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/services/profile/update_profile_service.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _formKey = GlobalKey<FormState>();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationList(),
        appBar: AppBar(
          title: const Text("My Account"),
        ),
        // drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Transform.scale(
                      scale: 1.0,
                      child: Switch(
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
                        activeTrackColor: const Color(0xFF00E5FF),
                        activeColor: const Color(0xFF00E5FF),
                      ),
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
                    onTap: () {
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      print("validated");
                      print("name--${nameController.text}");
                      print("phone--${phoneNumber.text}");
                      print("sign--${sign.text}");

                      var p = await updateprofile.userprofileUpdate(
                          nameController.text, phoneNumber.text, sign.text);
                      // Loader1(radius: 20.0, dotRadius: 6.0);
                      if (p.message != null) {
                        Utils.showSnackBar(context, p.message, AppColors.pink);
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
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
                        hintText: "Old Password",
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
                        hintText: "New Password",
                      ),
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
                        autocorrect: false,
                        hintText: "Confirm Password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Buttonn(
                  text: "Save",
                  bgcolor: AppColors.Blue,
                  leftPadding: 15.0,
                  onTap: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => Step1()));
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ));
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
            onPressed: () => Navigator.pop(context, 'Cancel'),
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
  }
}
