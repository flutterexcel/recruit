import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';

class Buttonn extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration( color: AppColors.blue,
                                    shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                       
                        child: FlatButton(
                                       
                                                    child: const Text(
                                                     "Save",style:TextStyle(color: Colors.white,fontSize: 20),
                                                     
                                                    ),
                                                    onPressed: ()
                                                    {
                                                      
                    },
                                              
                                                  ),
                      ),
                    ),
                  );
  }
}