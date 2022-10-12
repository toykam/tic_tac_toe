import 'package:flutter/material.dart';
import 'package:tic_tac_to_app/models/game.mode.model.dart';
import 'package:tic_tac_to_app/utils/styles.dart';
import 'package:tic_tac_to_app/utils/widgets.dart';

class SelectMode extends StatelessWidget {
  SelectMode({this.onModeSelected, this.selectedMode});
  Function onModeSelected;
  GameMode selectedMode;
  @override
  Widget build(BuildContext context) {
    print(selectedMode);
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWithStroke(text: 'Select Mode', strokeColor: primaryColor, strokeWidth: 1.5, textStyle: TextStyle(
            color: Colors.white, fontSize: 24, letterSpacing: 10
          )),
          SizedBox(height: 50,),
          InkWell(
            onTap: () => onModeSelected(GameMode.SinglePlayer),
            child: Visibility(
              visible: selectedMode == GameMode.SinglePlayer,
              replacement: Text('Single Player', style: gamePlayModeTextStyle,),
              child: textWithStroke(text: 'Single Player', strokeColor: lightPrimaryColor, strokeWidth: 1, textStyle: gamePlayModeTextStyle.copyWith(
                color: veryLightPrimaryColor
              )),
            ),
          ),
          SizedBox(height: 30,),

          InkWell(
            onTap: () => onModeSelected(GameMode.OfflineMultiPlayer),
            child: Visibility(
              visible: selectedMode == GameMode.OfflineMultiPlayer,
              replacement: Text('Offline Multi player', style: gamePlayModeTextStyle,),
              child: textWithStroke(text: 'Offline Multi player', strokeColor: lightPrimaryColor, strokeWidth: 1, textStyle: gamePlayModeTextStyle.copyWith(
                  color: veryLightPrimaryColor
              )),
            ),
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: () => onModeSelected(GameMode.OnlineMultiPlayer),
            child: Visibility(
              visible: selectedMode == GameMode.OnlineMultiPlayer,
              replacement: Text('Online Multi player', style: gamePlayModeTextStyle,),
              child: textWithStroke(text: 'Online Multi player', strokeColor: lightPrimaryColor, strokeWidth: 1, textStyle: gamePlayModeTextStyle.copyWith(
                  color: veryLightPrimaryColor
              )),
            ),
          )
        ],
      ),
    );
  }
}
