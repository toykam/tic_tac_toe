import 'package:tic_tac_to_app/models/player.model.dart';

import 'game.mode.model.dart';

class GameModel {
  Player player1 = Player(name: 'Player X', playerIndicator: 'X', rating: 5, id: 1);
  Player player2 = Player(name: 'Player 0', playerIndicator: '0', rating: 5, id: 2);
  Player winner;
  GameMode gameMode = GameMode.None;
  GamePlayerTurn gamePlayerTurn = GamePlayerTurn.Player1;

  GameModel({this.player1, this.player2, this.winner}) {
    player1 = Player(name: 'Player X', playerIndicator: 'X', rating: 5, id: 1);
    player2 = Player(name: 'Player 0', playerIndicator: '0', rating: 5, id: 2);
  }
}