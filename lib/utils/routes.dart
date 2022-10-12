import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_to_app/pages/GamePage/game_page.dart';
import 'package:tic_tac_to_app/pages/HomeScreenPage/start_game.dart';
import 'package:tic_tac_to_app/pages/SplashScreenPage/splash_screen.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    String name = settings.name;
    switch (name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreenPage());
        break;
      case '/start_game':
        return MaterialPageRoute(builder: (context) => StartGamePage());
        break;
      case '/game_page':
        return MaterialPageRoute(builder: (context) => GamePage(gameModel: settings.arguments,));
        break;
      default:
        return MaterialPageRoute(builder: (context) => Container(child: Center(child: Text('The page you looking for have been moved'),)));
    }
  }
}