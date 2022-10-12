import 'package:flutter/material.dart';
import 'package:tic_tac_to_app/models/game.mode.model.dart';
import 'package:tic_tac_to_app/models/game.model.dart';
import 'package:tic_tac_to_app/models/player.model.dart';
import 'package:tic_tac_to_app/pages/HomeScreenPage/select_mode.dart';
import 'package:tic_tac_to_app/pages/HomeScreenPage/select_player.dart';
import 'package:tic_tac_to_app/utils/styles.dart';
import 'package:tic_tac_to_app/utils/widgets.dart';

class StartGamePage extends StatefulWidget {
  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0, keepPage: true);
  GameModel _gameModel = GameModel();

  void setGameMode(GameMode gameMode) {
    _gameModel.gameMode = gameMode;
    setState(() {
      _gameModel = _gameModel;
    });
  }

  void setGamePlayer(Player player) {
    _gameModel.player1 = player;
    Player player2 = Player(id: 2, rating: 5, playerIndicator: player.playerIndicator == 'X' ? '0' : 'X', name: player.playerIndicator == 'X' ? 'Player 0' : 'Player X');
    // if (player.playerIndicator == 'X')
    _gameModel.player2 = player2;
    print("Player 1: ${player.name}");
    print("Player 2: ${player2.name}");
    setState(() {
      _gameModel = _gameModel;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0, right: 0, left: 0, bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentPage = value),
                children: [
                  SelectMode(selectedMode: _gameModel.gameMode, onModeSelected: setGameMode,),
                  SelectPlayer(onSelectPlayer: setGamePlayer, player1: _gameModel.player1,),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (_currentPage > 0)
                  ...[
                    TicTacToButton(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: Colors.white, size: buttonIconSize,),
                          SizedBox(width: 5,),
                          Text('back', style: buttonTextStyle,),
                        ],
                      ),
                      onClick: () {
                        setState(() {
                          _currentPage = _currentPage > 0 ?_currentPage - 1 : _currentPage;
                        });
                        _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInCubic);
                      },
                    ),
                    SizedBox(width: 10,),
                  ],
                TicTacToButton(
                  child: Row(
                    children: [
                      Text('Next', style: buttonTextStyle,),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: buttonIconSize,),
                    ],
                  ),
                  onClick: () {
                    if (_currentPage == 1) {
                      if (_gameModel.gameMode == GameMode.None) {
                      //  Say select game mode
                        print('Please select a game mode');
                      } else if (_gameModel.player1 == null) {
                      //  Say Select a player
                        print('Please select a player');
                      } else {
                      //  Go to game board
                        print('Going to game play');
                        Navigator.of(context).pushReplacementNamed('/game_page', arguments: _gameModel);
                      }
                    } else {
                      setState(() {
                        _currentPage = _currentPage < 2 ?_currentPage + 1 : _currentPage;
                      });
                      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInCubic);
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 0, right: 0, left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 20, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.cancel, color: primaryColor,)
                  ),
                  SizedBox(width: 20,),
                  AppNameWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
