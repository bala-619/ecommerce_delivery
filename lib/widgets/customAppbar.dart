import 'package:ecommerce_delivery/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
          color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor1
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      // widget.voidCallback();
                      // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ThemeSettings()));
                    },
                      icon: Icon(Icons.menu,color: Colors.white,size: 30,),
                    ),
                    Text(title,style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.white,),)
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child:   Row(
                      children: [
                        IconButton(onPressed: (){
                        },
                          icon: Icon(Icons.notifications_none,color: Colors.white,size: 30,),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
