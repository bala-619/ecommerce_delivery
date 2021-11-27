
import 'dart:async';

import 'package:ecommerce_delivery/model/approveModel.dart';
import 'package:ecommerce_delivery/model/orderedReceivedModel.dart';
import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:ecommerce_delivery/pages/approvedOrders/otpScreen.dart';
import 'package:ecommerce_delivery/widgets/circle.dart';
import 'package:ecommerce_delivery/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/authenticationPages/forgotPage.dart';
import 'package:scutiwidgets/authenticationPages/mail-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/phone-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/resetPassword.dart';
import 'package:scutiwidgets/expandedSection.dart';

class ApprovedOrder extends StatefulWidget {

  @override
  _ApprovedOrderState createState() => _ApprovedOrderState();
}

class _ApprovedOrderState extends State<ApprovedOrder> {
  late  double width,height,width2,height2,gridWidth;

  int selRowIndex=-1,selIndex=-1;

  List<ApproveModel> litems = [
    ApproveModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,isOutOfDelivery: false),
    ApproveModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,isOutOfDelivery: false),
    ApproveModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,isOutOfDelivery: true),
    ApproveModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,isOutOfDelivery: false),
    ApproveModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,isOutOfDelivery: false),

  ];
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ThemeNotifier>(
          builder: (context,th,child)=> Stack(
            children: [
              Container(
                width: width,
                height: height,
                color:  Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(title: 'Approve Orders'),

                      SizedBox(height: 10,),
                      Container(
                          padding: EdgeInsets.only(left:20),
                          child: Text('Swipe left to cancel',style: TextStyle(fontFamily: 'RR',fontSize: 14,color: Colors.grey,),)
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: litems.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Container(
                                  width: width,
                                  height: 80,
                                  margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10),
                                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color:th.borderColor),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child:Text('${litems[i].name}',style: TextStyle(fontFamily: 'RM',fontSize: 16,color: th.text1,),)
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child:Text('Order id :',style: TextStyle(fontFamily: 'RR',fontSize: 15,color: th.text1,),),
                                              ),
                                              Text('${litems[i].id}',style: TextStyle(fontFamily: 'RR',fontSize: 15,color: th.text1,),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child:Text('28 Items  ',style: TextStyle(fontFamily: 'RR',fontSize: 13,color: th.text1.withOpacity(0.5),),),
                                              ),
                                              Text('${litems[i].amt}',style: TextStyle(fontFamily: 'RM',fontSize: 15,color: th.primaryColor1,),)
                                            ],
                                          ),

                                        ],
                                      ),
                                      Spacer(),
                                      litems[i].isOutOfDelivery?Container(
                                        child: Row(
                                          children: [
                                            for(int j=0;j<3;j++)
                                            GestureDetector(
                                              onTap:(){
                                                if(selRowIndex==j){
                                                  setState(() {
                                                    selRowIndex=-1;
                                                    selIndex=-1;
                                                  });
                                                }
                                                else{
                                                  setState(() {
                                                    selRowIndex=j;
                                                    selIndex=i;
                                                  });
                                                  if(j==0){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryOtp()));
                                                    deSelect();

                                                  }
                                                  else if(j==2){
                                                    _callNumber();
                                                    deSelect();
                                                  }
                                                }
                                              },
                                              child: Circle(
                                                hei: 35,
                                                color:selRowIndex==j?th.borderColor.withOpacity(0.6): Colors.transparent,
                                                widget: Center(
                                                  child: Icon(j==0?Icons.visibility_outlined:
                                                  j==1?Icons.location_on_outlined:Icons.local_phone,
                                                    color: th.primaryColor1.withOpacity(0.8),size: 20,),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ):
                                      Container(
                                          width:100,
                                          height:30,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            color:th.borderColor.withOpacity(0.6),
                                          ),
                                          alignment:Alignment.center,
                                          child:Text('Out of delivery',style: TextStyle(fontFamily: 'RM',fontSize: 12,color: th.primaryColor1,),)
                                      ),
                                      litems[i].isOutOfDelivery?Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 32,
                                          width: 37,
                                          margin: EdgeInsets.only(top: 0),
                                          decoration: BoxDecoration(
                                            color: th.primaryColor1,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.electric_bike_outlined,color: Colors.white,size: 20,),
                                        ),
                                      ):Container(),

                                    ],
                                  ),
                                ),
                                CustomExpansionTile(
                                  expand: selRowIndex==1&&selIndex==i,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: width,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(top: 5,left: 10),
                                          child:Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                color: th.primaryColor1.withOpacity(0.8),size: 20,),
                                              Text('  ${litems[i].address}',
                                                style: TextStyle(fontFamily: 'RR',fontSize: 13,color: th.text1.withOpacity(0.5),),
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                )
                                /*Container(
                                  margin:EdgeInsets.only(right: 10,bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.end,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child:Text('4.5 KM ',style: TextStyle(fontFamily: 'RR',fontSize: 12,color: th.text1.withOpacity(0.5),),),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('5 min ago',style: TextStyle(fontFamily: 'RR',fontSize: 12,color:th.text1.withOpacity(0.5),),)
                                    ],
                                  ),
                                ),*/
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                    ]
                ),
              ),

            ],
          )
      ),
    );
  }
  deSelect(){
    Timer(Duration(milliseconds: 30), (){
      setState(() {
        selRowIndex=-1;
        selIndex=-1;
      });
    });
  }
  _callNumber() async{
    const number = '09898989898'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}