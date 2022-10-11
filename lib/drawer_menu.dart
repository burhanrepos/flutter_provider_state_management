/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/ui.dart';

const kTitle = 'Provider';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Consumer<UI>(
            builder: (context, ui, child) {
              return DrawerHeader(
                child: Center(
                  child: Text(
                    kTitle,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: ui.textColor == Colors.black
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: ui.textColor,
                ),
              );
            },
          ),
          getListTile('Home', onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          getLine(),
          getListTile('About', onTap: () {
            Navigator.pushReplacementNamed(context, '/about');
          }),
          getLine(),
          getListTile('Settings', onTap: () {
            Navigator.pushReplacementNamed(context, '/settings');
          }),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

//  Function gotoScreen(BuildContext context, String name) {
//    if (name == 'home') {
//      Navigator.pushNamed(context, '/');
//    } else if (name == 'about') {
//      Navigator.pushNamed(context, '/about');
//    } else if (name == 'settings') {
//      Navigator.pushNamed(context, '/settings');
//    }
//  }
}
