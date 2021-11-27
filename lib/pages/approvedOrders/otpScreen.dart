
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

class DeliveryOtp extends StatefulWidget {

  @override
  _DeliveryOtpState createState() => _DeliveryOtpState();
}

class _DeliveryOtpState extends State<DeliveryOtp> {
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
              SingleChildScrollView(
                child: Container(
                  width: width,
                  height: height,
                  color:  Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(title: 'Order: #5345344343'),
                        Container(
                          height: height-100,
                          width: width,
                          child: OtpScreen(
                            resetImg: 'assets/images/otp.png',
                            ontap: (){
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ]
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}