
import 'package:ecommerce_delivery/constants.dart';
import 'package:ecommerce_delivery/model/approveModel.dart';
import 'package:ecommerce_delivery/model/orderedReceivedModel.dart';
import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:ecommerce_delivery/widgets/circle.dart';
import 'package:ecommerce_delivery/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/authenticationPages/forgotPage.dart';
import 'package:scutiwidgets/authenticationPages/mail-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/phone-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/resetPassword.dart';
import 'package:scutiwidgets/expandedSection.dart';
import 'package:scutiwidgets/separator.dart';

class Payment extends StatefulWidget {

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
    width2=width-30;
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
                      CustomAppBar(title: 'Payment'),
                      Container(
                        height: height-100,
                        width: width,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20,),
                            Text("Order id # 342432",style: ts14(th.text1),),
                            SizedBox(height: 3,),
                            Text("344.99",style: ts18(th.text1,fontfamily: 'RB',fontsize: 22),),
                            SizedBox(height: 3,),
                            Text("( 28 items )",style: ts14(th.text1.withOpacity(0.7)),),
                            SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Circle(
                                        hei: 100,
                                        color: th.borderColor.withOpacity(0.4),
                                        widget: Center(
                                          child: Icon(Icons.payment,color:th.primaryColor1,size: 40,),
                                        ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text("Cash",style: ts14(th.text1),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Circle(
                                      hei: 100,
                                      color: th.borderColor.withOpacity(0.4),
                                      widget: Center(
                                        child: Icon(Icons.payment,color:th.primaryColor1,size: 40,),
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text("Cash",style: ts14(th.text1),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]
                ),
              ),

            ],
          )
      ),
    );
  }

}