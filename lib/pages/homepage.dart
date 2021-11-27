import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:ecommerce_delivery/pages/approvedOrders/approveOrders.dart';
import 'package:ecommerce_delivery/pages/cancelOrderlist.dart';
import 'package:ecommerce_delivery/pages/deliveryOrderlist.dart';
import 'package:ecommerce_delivery/pages/newOrderReceived.dart';
import 'package:ecommerce_delivery/widgets/bottomPainter.dart';
import 'package:ecommerce_delivery/widgets/circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelIndex=1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=> Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight!-60,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child:
                bottomSelIndex==1?NewOrderReceived():
                bottomSelIndex==2?ApprovedOrder():
                bottomSelIndex==3?CancelOrderList():
                bottomSelIndex==4?DeliveryOrderList():
                Container(),
              ),


              Positioned(
                bottom: 0,
                child: Container(
                  width: SizeConfig.screenWidth,
                  // height:_keyboardVisible?0:  70,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.white12.withOpacity(0.1),
                      // color: Color(0xFF787878).withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF787878).withOpacity(0.12),
                          spreadRadius: 5,
                          blurRadius: 25,
                          offset: Offset(0, 0), // changes position of shadow
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        margin:EdgeInsets.only(top: 0),
                        child: CustomPaint(
                          size: Size( SizeConfig.screenWidth!, 65),
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      Container(
                        width:  SizeConfig.screenWidth,
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bottomSelIndex=1;
                                  });
                                },
                                child: Icon(Icons.eleven_mp)
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bottomSelIndex=2;
                                  });
                                },
                                child: Icon(Icons.eleven_mp)
                            ),
                            Spacer(flex: 4,),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bottomSelIndex=3;
                                  });
                                },
                                child: Icon(Icons.eleven_mp)
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bottomSelIndex=4;
                                  });
                                },
                                child: Icon(Icons.eleven_mp)
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Circle(
                    hei: 60,
                    color: th.primaryColor1,
                    margin: EdgeInsets.only(bottom: 25),
                    widget: Center(
                      child: Icon(Icons.search,color: Colors.white,size: 30,),
                    ),
                ),
              )
            ],
          ),
        )
      ),

    );
  }
}
