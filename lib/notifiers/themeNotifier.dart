import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier{
  int selectThemeIndex=3;

  // Color primaryColor=Color(0xff6A8528);
  // Color primaryColor1=Color(0XFF4E6713);
  // Color primaryColor2=Color(0xFFE0E8D3);
  // Color primaryColor3=Color(0xFF90A75B);

  Color primaryColor1=Color(0xFF5431EA);
  Color borderColor=Color(0xFFD8D8D8);
  Color text1=Color(0xFF555555);

  Color addNewAppBarColor=Color(0xFFF6F5F9);
  Color addNewBodyColor=Color(0xFFffffff);

  updateTheme(int index){
    selectThemeIndex=index;

    if(index==1){

      primaryColor1=Color(0XFF4E6713);

    }
    else if(index==2){

      primaryColor1=Color(0XffA73A24);

      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==3){

       primaryColor1=Color(0xFF5431EA);
       borderColor=Color(0xFFD8D8D8);
       text1=Color(0xFF555555);
       addNewAppBarColor=Color(0xFFF6F5F9);
       addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==4){

      primaryColor1=Color(0XffAA6720);

      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==5){

      primaryColor1=Color(0Xff1267A8);

      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }




    else{
      primaryColor1=Color(0xff6A8528);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }


    notifyListeners();

  }

}