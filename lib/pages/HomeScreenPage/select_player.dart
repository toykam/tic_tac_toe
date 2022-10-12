import 'package:flutter/material.dart';
import 'package:tic_tac_to_app/models/player.model.dart';
import 'package:tic_tac_to_app/utils/styles.dart';
import 'package:tic_tac_to_app/utils/widgets.dart';

class SelectPlayer extends StatelessWidget {
  SelectPlayer({this.onSelectPlayer, this.player1});
  Function onSelectPlayer;
  Player player1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: textWithStroke(text: 'Select Player', strokeColor: primaryColor, strokeWidth: 1.5, textStyle: TextStyle(
                color: Colors.white, fontSize: 24, letterSpacing: 10
            )),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: () => onSelectPlayer(Player(id: 1, name: 'Player X', playerIndicator: 'X', rating: 5)),
            child: textWithStroke(
              text: 'X',
              textStyle: player1.playerIndicator == 'X' ? playerTextStyle.copyWith(
                shadows: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black, spreadRadius: 0, offset: Offset(0, 4)
                  )
                ]
              ) : playerTextStyle,
              strokeWidth: 1,
              strokeColor: player1.playerIndicator == 'X' ? primaryColor : Colors.black)
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: () => onSelectPlayer(Player(id: 1, name: 'Player 0', playerIndicator: '0', rating: 5)),
            child: textWithStroke(
              text: '0',
              textStyle: player1.playerIndicator == '0' ? playerTextStyle.copyWith(
                  shadows: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black, spreadRadius: 0, offset: Offset(0, 4)
                    )
                  ]
              ) : playerTextStyle,
              strokeWidth: 1,
              strokeColor: player1.playerIndicator == '0' ? primaryColor : Colors.black
            )
          ),
          // Text('0', style: playerTextStyle,),
        ],
      ),
    );
  }
}
