import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/bouncing_entrances/bounce_in.dart';
import 'package:tic_tac_to_app/utils/styles.dart';
import 'package:tic_tac_to_app/utils/widgets.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [veryLightPrimaryColor, Colors.white, veryLightPrimaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0, left: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 70),
              child: TicTacToButton(
                onClick: () => Navigator.of(context).pushNamed('/start_game'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 20),
                    SlideInLeft(
                      preferences: AnimationPreferences(
                        duration: Duration(seconds: 1),
                      ),
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0, right: 0, left: 0, bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: lightPrimaryColor,
                          offset: Offset(0, 5),spreadRadius: 0, blurRadius: 10
                        )
                      ]
                    ),
                    height: 240,
                    width: 240,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Swing(
                          preferences: AnimationPreferences(
                            autoPlay: AnimationPlayStates.PingPong,
                            duration: Duration(seconds: 5),
                          ),
                          child: textWithStroke(text: 'X', textStyle: TextStyle(
                            color: primaryColor, fontSize: 116.53,
                            fontWeight: FontWeight.w900,
                          ), strokeColor: Colors.white,strokeWidth: 5),
                        ),
                        SizedBox(width: 20,),
                        BounceIn(
                          preferences: AnimationPreferences(
                            autoPlay: AnimationPlayStates.PingPong,
                            duration: Duration(seconds: 5),
                          ),
                          child: textWithStroke(text: '0', textStyle: TextStyle(
                            color: primaryColor, fontSize: 116.53,
                            fontWeight: FontWeight.w900,
                          ), strokeColor: Colors.white,strokeWidth: 5),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .10,
                  ),
                  AppNameWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}