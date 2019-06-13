import 'package:flutter/material.dart';

/// @author SumMer
/// @date 2019-05-24 0249:54
/// @Description:
///

class ShowDialogWidget extends StatefulWidget {
  final String title;
  final String content;

  ShowDialogWidget({Key key, @required this.title, @required this.content})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShowDialogWidgetState();
  }
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AlertDialog(
      title: new Text(widget.title),
      content: new Text(widget.content),
    );
  }
}

alert(context, title, content) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, state) {
          return new ShowDialogWidget(
            title: title,
            content: content,
          );
        },
      );
    },
  );
}
