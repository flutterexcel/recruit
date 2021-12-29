import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class MyAccount extends StatelessWidget {
 bool isSwitched = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Account"),),

      drawer:NavigationList(),
      body: SingleChildScrollView(
        child: Column(
          children: [


          const  SizedBox(height: 40,),


            Column(children: [

              Transform.scale(
                                         scale: 1.0,
                                         
                                         child: Switch(
                                                   value: isSwitched,
                                                   onChanged: (value) {

                                                    //  setState(() {
                                                    //    isSwitched = value;
                                                  
                                                    //  });
                                                   },
                                                   activeTrackColor:const Color(0xFF00E5FF),
                                                   activeColor: const Color(0xFF00E5FF),
                                                 ),
                                       ),

 const Text("Don't show quick message during shortlist",style: TextStyle(fontSize: 10),),


            ],),

           const SizedBox(height: 25,),


            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(children: const [

                 Text("PERSONAL ",style: TextStyle(fontSize: 15)),
                 Text("PROFILE",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
              ],),
            ),

            const SizedBox(height: 15,),


            const CircleAvatar(
    radius: 30,
    backgroundColor: Colors.teal,
    child: CircleAvatar(
      
      backgroundImage: AssetImage('assets/images/def.png'),
      
      radius: 38,
    ),
  ),

  const SizedBox(height: 15,),

  Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15.0),
    child: Column(children: [

       const Align(
                       
                  alignment: Alignment.centerLeft,
                      child:  Text(
                            "Name",
                                  ),
                    ),
                   const SizedBox(height: 5),
                
                
                       TextField(
                              //  controller: companyNameController,
                                autocorrect: true,
                                decoration:  InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                               ),
                               ),
                    


    ],),
  ),

   
              
                 const SizedBox(height:9),


                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(children: [
const  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "Phone Number",
                                 ),
                    ),
                  const  SizedBox(height: 5),
              
                 
                       TextField(
                     //   controller: userNameController,
                        autocorrect: true,
                        decoration:   InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        hintText: "phone number"),
              
                             
                              ),
                    
                 const  SizedBox(height: 15),

                    ],),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(children: [
 const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "Email",
                                 ),
                    ),
                  const  SizedBox(height: 5),
              
                 
                       TextField(
                     //   controller: userNameController,
                        autocorrect: true,
                        decoration:   InputDecoration(
                          
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        fillColor: Colors.grey,
                        filled: true,
                        ),
              
                             
                              ),
                    
             
                    ],),
                  ),

                    const  SizedBox(height: 15),



                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(children: [
  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "Template Signature",
                                 ),
                    ),
                   const SizedBox(height: 5),

                   Container(


 width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration:   BoxDecoration( border: Border.all(color: Colors.black),
 shape: BoxShape.rectangle, borderRadius: const BorderRadius.all(Radius.circular(10)),),
child: TextField(
                     //   controller: userNameController,
                        autocorrect: true,
                        
                         decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '  Write your signature here')
                             
                              ),
                
               ),
              
                 
                       
                    
             
                    ],),
                  ),

                   const SizedBox(height: 9),


                  Buttonn(),


                     const SizedBox(height: 20),



                     Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(children: const [

                 Text("CHANGE ",style: TextStyle(fontSize: 15)),
                 Text("PASSWORD",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
              ],),
            ),

               const SizedBox(height: 20),


               Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15.0),
    child: Column(children: [

       const Align(
                       
                  alignment: Alignment.centerLeft,
                      child:  Text(
                            "Old Password",
                                  ),
                    ),
                   const SizedBox(height: 5),
                
                
                
                       TextField(
                              //  controller: companyNameController,
                                autocorrect: true,
                                decoration:  InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                                hintText: "Old Password"
                               ),
                               ),
                    


    ],),
  ),

   
              
                 const SizedBox(height:9),


                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(children: [
const  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "New Password",
                                 ),
                    ),
                  const  SizedBox(height: 5),
              
                 
                       TextField(
                     //   controller: userNameController,
                        autocorrect: true,
                        decoration:   InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        hintText: "New Password"),
              
                             
                              ),
                    
                 const  SizedBox(height: 15),

                    ],),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(children: [
 const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                            "Confirm Password",
                                 ),
                    ),
                  const  SizedBox(height: 5),
              
                 
                       TextField(
                     //   controller: userNameController,
                        autocorrect: true,
                        decoration:   InputDecoration(
                          
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                         hintText: "Confirm Password"
                        ),
              
                             
                              ),
                    
             
                    ],),
                  ),

                    const  SizedBox(height: 15),


                     Buttonn(),


                  const  SizedBox(height: 15),



                  
              
                
              







           



            
          ],
        ),
      )
    
    
    );
  }
}