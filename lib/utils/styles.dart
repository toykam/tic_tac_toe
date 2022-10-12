import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF56868);
const lightPrimaryColor = Color(0xFFF8AFAF);
const veryLightPrimaryColor = Color(0xFFFDEDED);

TextStyle buttonTextStyle = TextStyle(
  color: Colors.white, fontSize: 12
);

TextStyle gamePlayModeTextStyle = TextStyle(
  fontSize: 36, fontWeight: FontWeight.w300
);

TextStyle playerTextStyle = TextStyle(
    fontSize: 96, fontWeight: FontWeight.w900, color: Colors.white,
    shadows: [
      BoxShadow(
        blurRadius: 10, color: primaryColor, spreadRadius: 0, offset: Offset(0, 4)
      )
    ]
);

const buttonIconSize = 12.0;