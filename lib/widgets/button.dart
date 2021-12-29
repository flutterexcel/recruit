import 'package:flutter/material.dart';

class Buttonn extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration( color: Colors.blue,
                                    shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                       
                        child: FlatButton(
                                       
                                                    child: const Text(
                                                     "Save",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                                     
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