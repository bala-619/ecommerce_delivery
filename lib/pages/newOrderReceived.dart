
import 'package:ecommerce_delivery/constants.dart';
import 'package:ecommerce_delivery/model/orderedReceivedModel.dart';
import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:ecommerce_delivery/widgets/circle.dart';
import 'package:ecommerce_delivery/widgets/customAppbar.dart';
import 'package:ecommerce_delivery/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class NewOrderReceived extends StatefulWidget {

  @override
  _NewOrderReceivedState createState() => _NewOrderReceivedState();
}

class _NewOrderReceivedState extends State<NewOrderReceived> {
  late  double width,height,width2,height2,gridWidth;

  List<NewOrderReceivedModel> litems = [
    NewOrderReceivedModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,),
    NewOrderReceivedModel(name: "Ramesh",id:"3434355" ,items:"28" ,amt:"2,4000" ,address:"no:49, thiruverkadu ,Chennai-77" ,)

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
                    CustomAppBar(title: 'New Order Received'),
                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.only(left:20),
                        child: Text('Swipe left to cancel',style: TextStyle(fontFamily: 'RR',fontSize: 14,color: Colors.grey,),)
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: litems.length,
                        itemBuilder: (context, i) {
                          return Dismissible(
                            key: Key(i.toString()),
                            movementDuration: Duration(milliseconds: 300),
                            confirmDismiss: (direction) async{
                              switch(direction) {
                                case DismissDirection.endToStart:
                                  return await rejectReason() == true;
                                case DismissDirection.startToEnd:
                                  return await rejectReason() == true;
                                case DismissDirection.horizontal:
                                case DismissDirection.vertical:
                                case DismissDirection.up:
                                case DismissDirection.down:
                                  assert(false);
                              }
                              return false;
                            },
                            // Show a red background as the item is swiped away.
                            background: Container(color: Colors.red),
                            child: Column(
                              children: [
                                Container(
                                  width: width,
                                  height: 105,
                                  margin: EdgeInsets.only(left: 10.0,right: 10.0,),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color:th.borderColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
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
                                          GestureDetector(
                                            onTap: (){
                                         
                                            },
                                            child: Container(
                                                width:100,
                                                height:30,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  color:Color(0XFF6B3CFA),
                                                ),
                                                alignment:Alignment.center,
                                                child:Text('Accept',style: TextStyle(fontFamily: 'RM',fontSize: 14,color: Colors.white,),)
                                            ),
                                          ),

                                          SizedBox(width: 10,)
                                        ],
                                      ),
                                      Container(
                                          width: width,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(top: 5),
                                          child:Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                color: th.primaryColor1.withOpacity(0.8),size: 20,),
                                              Text(' ${litems[i].address}',
                                                style: TextStyle(fontFamily: 'RR',fontSize: 13,color: th.text1.withOpacity(0.5),),
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
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
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ]
              ),
            ),

          ],
        )
      ),
    );
  }

List<String> rejectReasons=["gfdsdgddgd","gdgdgddgdddg","ggddgddgdgd"];
  Future<bool?> rejectReason(){
    double wid=SizeConfig.screenWidth!-40;
    return showDialog<bool>(context: context,
        barrierDismissible: false,
        builder: (ctx){
          return StatefulBuilder(
            builder:(conte,setState){
              return Consumer<ThemeNotifier>(
                builder:(q,on,c)=>Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: SizeConfig.screenHeight!*0.7,
                    width: wid,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70,),
                        Container(
                          height: 50,
                          //width: wid*0.8,
                            margin: EdgeInsets.all(20),
                         // color: AppTheme.restroTheme,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.only(left: 20),
                          child: AddNewLabelTextField(
                            margin: EdgeInsets.only(left: 0),
                            hintText: "Enter Reason",
                          )
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                          height: SizeConfig.screenHeight!*0.6-180,
                          width: wid-40,
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Wrap(
                              // crossAxisAlignment: WrapCrossAlignment.start,
                              // alignment: WrapAlignment.start,
                              // runAlignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                for(int index=0;index<rejectReasons.length;index++)
                                  GestureDetector(
                                    onTap: (){

                                      Navigator.pop(ctx);
                                    },
                                    child: Chip(
                                    //  height: 50,
                                     // width: wid*0.4,
                                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      backgroundColor: on.borderColor.withOpacity(0.2),
                                      label: Container(
                                        //height: 30,
                                          /*decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color:on.borderColor.withOpacity(0.2)
                                          ),*/
                                        child: Text(rejectReasons[index],
                                          style: ts14(on.text1),
                                        ),
                                      ),
                                    //  margin: EdgeInsets.only(top: 15),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(5),
                                    //       color:on.borderColor.withOpacity(0.4)
                                    //   ),
                                    //  alignment: Alignment.center,
                                    //   child: Container(
                                    //     height: 18,
                                    //   //  width: wid*0.6,
                                    //     child: FittedBox(
                                    //       child: Text("${rejectReasons[index]}"),
                                    //     ),
                                    //   ),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(ctx);
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                margin: EdgeInsets.only(top: 5,right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: on.borderColor.withOpacity(0.4)
                                ),
                                child: Center(
                                  child: Text("Cancel",style: TextStyle(fontFamily: 'RM',fontSize: 14,color: on.text1),),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(ctx);
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: on.primaryColor1
                                ),
                                child: Center(
                                  child: Text("Done",style: TextStyle(fontFamily: 'RM',fontSize: 14,color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
