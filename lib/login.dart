
import 'package:ecommerce_delivery/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:scutiwidgets/authenticationPages/forgotPage.dart';
import 'package:scutiwidgets/authenticationPages/login.dart';
import 'package:scutiwidgets/authenticationPages/mail-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/phone-otp/otp_screen.dart';
import 'package:scutiwidgets/authenticationPages/resetPassword.dart';
class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LoginPage(
      img: 'assets/images/home.png',
      loginTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
      },
      signUpTap: (){},
      forgotTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Forgot(
          img: "assets/images/forget.png",
          emailTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MailScreen(
              resetImg: 'assets/images/mail.png',
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword(
                  img: 'assets/images/resetpassword.png',
                  submitCb: (){

                  },
                )),);
              },

            )),);
          },
          mobileTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(
              resetImg: 'assets/images/otp.png',
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword(
                  img: 'assets/images/resetpassword.png',
                  submitCb: (){

                  },
                )),);
              },
            )),);
          },
        )
        )
        );
      },
      showConnectWith: true,
    );
  }
}
