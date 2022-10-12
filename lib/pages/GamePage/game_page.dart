import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/animation/animator_play_states.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/attention_seekers/swing.dart';
import 'package:tic_tac_to_app/models/game.mode.model.dart';
import 'package:tic_tac_to_app/models/game.model.dart';
import 'package:tic_tac_to_app/models/player.model.dart';
import 'package:tic_tac_to_app/utils/styles.dart';
import 'package:tic_tac_to_app/utils/widgets.dart';

class GamePage extends StatefulWidget {
  GamePage({this.gameModel});
  GameModel gameModel;
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> gameBoardBox;
  GameModel _gameModel;
  Player player1;
  Player player2;
  Player winner;
  GamePlayerTurn gamePlayerTurn;
  int round = 1;
  bool gameHasEnded = false;

  @override
  void initState() {
    // TODO: implement initState
    refresh();
    // print("CurrentPlayer ${_gameModel.gamePlayerTurn}");
    super.initState();
  }

  refresh() {
    setState(() {
      gameBoardBox = List.filled(9, '');
      _gameModel = widget.gameModel;
      player1 = _gameModel.player1;
      player2 = _gameModel.player2;
      gamePlayerTurn = GamePlayerTurn.Player1;
      gameHasEnded = false;
      winner = null;
    });
  }

  play(int pos) {
    if (gameBoardBox[pos].isEmpty && !gameHasEnded) {
      if (gamePlayerTurn == GamePlayerTurn.Player1) {
        gameBoardBox[pos] = player1.playerIndicator;
        _gameModel.gamePlayerTurn = GamePlayerTurn.Player2;
        play(0);
      } else if (gamePlayerTurn == GamePlayerTurn.Player2) {
        List emptyBoard = gameBoardBox.where((element) => element.isEmpty).toList();
        print(emptyBoard);
        gameBoardBox[pos] = player2.playerIndicator;
        _gameModel.gamePlayerTurn = GamePlayerTurn.Player1;
      }
      // Update game box board and game model to reflex player
      setState(() {
        gameBoardBox = gameBoardBox;
        _gameModel = _gameModel;
        gamePlayerTurn = _gameModel.gamePlayerTurn;
      });
      // print("${gameBoardBox}");
      print("CurrentPlayer ${_gameModel.gamePlayerTurn}");
      checkIfWinner();
      checkIfGameHaveFinished();
    }
  }

  checkIfWinner() {
    if (gameBoardBox[0] == gameBoardBox[1] && gameBoardBox[1] == gameBoardBox[2]) {
      print('${gameBoardBox[0]} won on line 012');
      chooseWinner(gameBoardBox[0]);
    } else if (gameBoardBox[3] == gameBoardBox[4] && gameBoardBox[4] == gameBoardBox[5]) {
      print('${gameBoardBox[3]} won on line 345');
      chooseWinner(gameBoardBox[3]);
    } else if (gameBoardBox[6] == gameBoardBox[7] && gameBoardBox[7] == gameBoardBox[8]) {
      print('${gameBoardBox[6]} won on line 678');
      chooseWinner(gameBoardBox[6]);
    } else if (gameBoardBox[0] == gameBoardBox[4] && gameBoardBox[4] == gameBoardBox[8]) {
      print('${gameBoardBox[0]} won on line 045');
      chooseWinner(gameBoardBox[0]);
    } else if (gameBoardBox[2] == gameBoardBox[4] && gameBoardBox[4] == gameBoardBox[6]) {
      print('${gameBoardBox[2]} won on line 246');
      chooseWinner(gameBoardBox[2]);
    } else if (gameBoardBox[1] == gameBoardBox[4] && gameBoardBox[4] == gameBoardBox[7]) {
      print('${gameBoardBox[1]} won on line 147');
      chooseWinner(gameBoardBox[1]);
    } else if (gameBoardBox[0] == gameBoardBox[3] && gameBoardBox[3] == gameBoardBox[6]) {
      print('${gameBoardBox[0]} won on line 147');
      chooseWinner(gameBoardBox[0]);
    } else if (gameBoardBox[2] == gameBoardBox[5] && gameBoardBox[5] == gameBoardBox[8]) {
      print('${gameBoardBox[2]} won on line 147');
      chooseWinner(gameBoardBox[2]);
    }
  }

  //Check if all board have been filled
  checkIfGameHaveFinished() {
    if(!gameBoardBox.contains('')) {
      print('Game has end');
      setState(() {
        gameHasEnded = true;
      });
    }
  }

  chooseWinner(String indicator) {
    if (indicator.isNotEmpty) {
      if (player1.playerIndicator == indicator) {
        setState(() {
          winner = player1;
          gameHasEnded = true;
          player1.score += 1;
        });
      } else if (player2.playerIndicator == indicator) {
        setState(() {
          winner = player2;
          gameHasEnded = true;
          player2.score += 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('GameBoardBox: $gameBoardBox');
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0, right: 0, left: 0, bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 200),
              alignment: Alignment.center,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  // ...gameBoardBox.map((e) => )
                  InkWell(
                    onTap: () {
                      play(0);
                    },
                    child: EachBoard(boardValue: gameBoardBox[0],),
                  ),
                  InkWell(
                    onTap: () {
                      play(1);
                    },
                    child: EachBoard(boardValue: gameBoardBox[1],),
                  ),InkWell(
                    onTap: () {
                      play(2);
                    },
                    child: EachBoard(boardValue: gameBoardBox[2],),
                  ),InkWell(
                    onTap: () {
                      play(3);
                    },
                    child: EachBoard(boardValue: gameBoardBox[3],),
                  ),InkWell(
                    onTap: () {
                      play(4);
                    },
                    child: EachBoard(boardValue: gameBoardBox[4],),
                  ),InkWell(
                    onTap: () {
                      play(5);
                    },
                    child: EachBoard(boardValue: gameBoardBox[5],),
                  ),InkWell(
                    onTap: () {
                      play(6);
                    },
                    child: EachBoard(boardValue: gameBoardBox[6],),
                  ),InkWell(
                    onTap: () {
                      play(7);
                    },
                    child: EachBoard(boardValue: gameBoardBox[7],),
                  ),InkWell(
                    onTap: () {
                      play(8);
                    },
                    child: EachBoard(boardValue: gameBoardBox[8],),
                  ),

                ],
              ),
            ),
          ),

          Positioned(
            top: 0, right: 0, left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${player1.name}', style: TextStyle(fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWithStroke(text: '${player1.playerIndicator}', strokeWidth: 2, strokeColor: primaryColor, textStyle: TextStyle(
                                    fontSize: 24, color: Colors.white
                                )),
                                // if ()
                                //   ...[
                                //
                                //   ],
                                SizedBox(width: 10,),
                                CircleAvatar(
                                  backgroundColor: gamePlayerTurn == GamePlayerTurn.Player1 ? primaryColor : Colors.transparent,
                                  radius: 5,
                                ),
                                SizedBox(width: 10,),
                                Text('${player1.score}', style: TextStyle(
                                    fontSize: 24, color: Colors.black87, fontWeight: FontWeight.w700
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: veryLightPrimaryColor,
                        radius: 32,
                        child: Text('$round', style: TextStyle(color: primaryColor, fontSize: 24, fontWeight: FontWeight.w900),),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${player2.name}', style: TextStyle(fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWithStroke(text: '${player2.playerIndicator}', strokeWidth: 2, strokeColor: primaryColor, textStyle: TextStyle(
                                    fontSize: 24, color: Colors.white
                                )),
                                // if (gamePlayerTurn == GamePlayerTurn.Player2)
                                //   ...[
                                //     SizedBox(width: 10,),
                                //     CircleAvatar(
                                //       backgroundColor: primaryColor,
                                //       radius: 5,
                                //     )
                                //   ],
                                SizedBox(width: 10,),
                                CircleAvatar(
                                  backgroundColor: gamePlayerTurn == GamePlayerTurn.Player2 ? primaryColor : Colors.transparent,
                                  radius: 5,
                                ),
                                SizedBox(width: 10,),
                                Text('${player2.score}', style: TextStyle(
                                    fontSize: 24, color: Colors.black87, fontWeight: FontWeight.w700
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("${gamePlayerTurn == GamePlayerTurn.Player1 ? player1.name : player2.name}'s Turn", style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w300
                  ),),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0, right: 0, left: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 50, left: 20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => closeGame(context),
                    child: Icon(Icons.cancel, color: primaryColor,)
                  ),
                  SizedBox(width: 20,),
                  AppNameWidget(),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20, right: 0, left: 0,
            child: Container(
              child: InkWell(
                onTap: () => refresh(),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: veryLightPrimaryColor,
                  child: Icon(Icons.refresh, color: primaryColor,),
                ),
              ),
            ),
          ),

          if (gameHasEnded)
            ...[
              Positioned(
                top: 0, bottom: 0, left: 0, right: 0,
                child: Container(
                  color: veryLightPrimaryColor.withOpacity(.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (winner == null)
                        ...[
                          Text('Draw Game', style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w900
                          ),),
                          SizedBox(height: 50,),
                        ],
                      if (winner != null)
                        ...[
                          Text('${winner.name} Won', style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900
                          ),),
                          SizedBox(height: 50,),
                          Swing(
                            preferences: AnimationPreferences(
                              autoPlay: AnimationPlayStates.PingPong,
                              duration: Duration(seconds: 5),
                            ),
                            child: textWithStroke(text: '${winner.playerIndicator}', textStyle: TextStyle(
                              color: primaryColor, fontSize: 116.53,
                              fontWeight: FontWeight.w900,
                            ), strokeColor: Colors.white,strokeWidth: 5),
                          ),
                          SizedBox(height: 50,),
                        ],
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TicTacToButton(
                              child: Text('Play again', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                              onClick: () {
                                setState(() {
                                  round += 1;
                                });
                                refresh();
                              },
                            ),

                            TicTacToButton(
                              child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                              onClick: () => closeGame(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ],
      ),
    );
  }
}

closeGame(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FadeInUp(
        preferences: AnimationPreferences(
          duration: Duration(milliseconds: 500)
        ),
        child: Popover(
          title: 'Do you want close the game?',
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TicTacToButton(
                  child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                  onClick: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
