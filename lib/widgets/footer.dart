import 'package:flutter/material.dart';
import 'package:pcg/theme/theme_manager.dart';

class Footer extends StatelessWidget {

  const Footer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color overlineColor = themeManager.isDarkMode ? Colors.white : Color(0xFFB4914C);

    String imageSuffix = themeManager.isDarkMode ? "_b" : "";

    return Material(
      elevation: 5,
      color: themeManager.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Container(
            height: 1.0, 
            color: overlineColor,
          ),
          SizedBox(height: 20),
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/facebook_icon$imageSuffix.png', 
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/x_icon$imageSuffix.png', 
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/google_icon$imageSuffix.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
          SizedBox(height: 20), 
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                "Copyright Powerclub Global LLC ©",
                style: TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Cinzel',
                  color: themeManager.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
