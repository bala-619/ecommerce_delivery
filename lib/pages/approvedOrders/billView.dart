
import 'package:ecommerce_delivery/constants.dart';
import 'package:ecommerce_delivery/model/approveModel.dart';
import 'package:ecommerce_delivery/model/orderedReceivedModel.dart';
import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:ecommerce_delivery/pages/approvedOrders/payment.dart';
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

class BillView extends StatefulWidget {

  @override
  _BillViewState createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
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
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(title: 'Order: #5345344343'),
                        Container(
                          height: height-100,
                          width: width,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 10,),
                              Icon(Icons.shopping_cart_outlined,size: 70,color: th.borderColor.withOpacity(1),),
                              Text("SUPERMARKET",style: ts12(th.text1,fontfamily: 'RM'),),
                              SizedBox(height: 7,),
                              Text("#26, Bharathi Nagar, Erungaballam",style: ts14(th.text1,fontfamily: 'RR'),),
                              Text("Chennai - 600033",style: ts14(th.text1,fontfamily: 'RR'),),
                              SizedBox(height: 10,),
                              MySeparator(height: 1, color: th.borderColor,),
                              Container(
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width2*0.6,
                                      alignment: Alignment.centerLeft,
                                      child: Text("ITEMS",style: ts18(th.text1,fontsize: 15,),),
                                    ),
                                    Container(
                                      width: width2*0.15,
                                      alignment: Alignment.centerRight,
                                      child: Text("QTY",style: ts18(th.text1,fontsize: 15,),),
                                    ),
                                    Container(
                                      width: width2*0.25,
                                      alignment: Alignment.centerRight,
                                      child: Text("AMT",style: ts18(th.text1,fontsize: 15,),),
                                    ),
                                  ],
                                ),
                              ),
                              MySeparator(height: 1, color: th.borderColor,),
                              Container(
                                height: 160,
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (ctx,i){
                                    return Container(
                                      height: 40,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width2*0.6,
                                            alignment: Alignment.centerLeft,
                                            child: Text("Tomato",style: ts18(th.text1.withOpacity(0.7),fontsize: 15,),),
                                          ),
                                          Container(
                                            width: width2*0.15,
                                            alignment: Alignment.centerRight,
                                            child: Text("2",style: ts18(th.text1.withOpacity(0.7),fontsize: 15,),),
                                          ),
                                          Container(
                                            width: width2*0.25,
                                            alignment: Alignment.centerRight,
                                            child: Text("4324",style: ts18(th.text1,fontsize: 15,fontfamily: 'RM'),),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              MySeparator(height: 1, color: th.borderColor,),
                              footer("Total", 43443),
                              footer("Tax(10%)", 178.98),
                              MySeparator(height: 1, color: th.borderColor,),
                              Container(
                                height: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width2*0.6,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Grand Total",style: ts18(th.text1.withOpacity(0.7),fontsize: 16,),),
                                    ),
                                    Container(
                                      width: width2*0.4,
                                      alignment: Alignment.centerRight,
                                      child: Text("1787.8",style: ts18(th.text1,fontsize: 18,fontfamily: 'RM'),),
                                    ),
                                  ],
                                ),
                              ),
                              MySeparator(height: 1, color: th.borderColor,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                                },
                                child: Container(
                                  width: width2*0.9,
                                  height: 45,
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: th.primaryColor1
                                  ),
                                  child: Text("Pay 2344",style: ts16(Colors.white,fontfamily: 'RM',ls: 0.5),),
                                ),
                              ),
                              MySeparator(height: 1, color: th.borderColor,),
                              Spacer(),
                              Text("Thank you for your interest",style: ts14(th.text1),),
                              Spacer(),
                            ],
                          ),
                        ),
                      ]
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }

  footer(String title,dynamic value){
    return   Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width2*0.6,
            alignment: Alignment.centerLeft,
            child: Text(title,style: ts18(Provider.of<ThemeNotifier>(context,listen: false).text1.withOpacity(0.7),fontsize: 15,),),
          ),
          Container(
            width: width2*0.4,
            alignment: Alignment.centerRight,
            child: Text("$value",style: ts18(Provider.of<ThemeNotifier>(context,listen: false).text1,fontsize: 15,fontfamily: 'RM'),),
          ),
        ],
      ),
    );
  }
}