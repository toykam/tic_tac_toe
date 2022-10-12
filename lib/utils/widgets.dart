import 'package:flutter/material.dart';
import 'package:tic_tac_to_app/utils/styles.dart';

class TicTacToButton extends StatelessWidget {
  TicTacToButton({this.child, this.onClick});
  Widget child;
  Function onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: child,
      ),
    );
  }
}
class AppNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Hero(
        tag: 'app_name',
        child: textWithStroke(text: 'Tic Tac To', strokeWidth: 2, strokeColor: primaryColor, textStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900,
        )),
      ),
    );
  }
}

Widget textWithStroke({String text, double strokeWidth: 1, Color strokeColor: Colors.black, TextStyle textStyle}) {
  return Stack(
    children: <Widget>[
      Text(
        text,
        style: textStyle.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
      ),
      Text(text, style: textStyle),
    ],
  );
}


class EachBoard extends StatelessWidget {
  EachBoard({this.boardValue});
  String boardValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 100, width: 100,
      decoration: BoxDecoration(
          color: veryLightPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: textWithStroke(strokeColor: lightPrimaryColor, text: '$boardValue', strokeWidth: 5, textStyle: TextStyle(
          fontSize: 64, color: veryLightPrimaryColor
      )),
    );
  }
}


class Popover extends StatelessWidget {
  const Popover({
    Key key,
    this.child,
    this.title,
    this.onClose
  }) : super(key: key);

  final Widget child;
  final String title;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      // color: Colors.transparent,
      // height: 900,
      constraints: BoxConstraints(maxHeight: 500,),
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandle(context),
          // Text('$title'),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '$title', style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500
              ),
              )
          ),
          SizedBox(height: 10,),
          if (child != null)
            ...[
              Flexible(flex: 1, child: child),
            ],
          SizedBox(height: 10,),
          FlatButton(
            child: Text('Cancel', style: TextStyle(color: Colors.redAccent),),
            // color: Colors.redAccent,
            onPressed: () {
              if (onClose != null) {
                onClose();
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}

