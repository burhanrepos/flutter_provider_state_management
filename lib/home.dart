/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/drawer_menu.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_state_management/model/ui.dart';

const kAppTitle = 'State Management by Provider';
const kStateType = 'Provider';

class Home extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Consumer<UI>(
      builder: (context, ui, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                kAppTitle,
                style: TextStyle(
                    color: ui.textColor == Colors.black
                        ? Colors.white
                        : Colors.black),
              ),
              backgroundColor: ui.textColor,
            ),
            drawer: DrawerMenu(),
            body: Container(
                margin: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    text: text,
                    style:
                        TextStyle(fontSize: ui.fontSize, color: ui.textColor),
                  ),
                )));
      },
    );
  }
}
