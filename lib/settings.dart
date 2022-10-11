/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_provider_state_management/drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_state_management/model/ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UI>(builder: (context, ui, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: ui.textColor,
            title: Text('Settings'),
          ),
          drawer: DrawerMenu(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${ui.fontSize.toInt()}',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headline5?.fontSize),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: ui.sliderFontSize,
                  onChanged: (newValue) {
                    ui.fontSize = newValue;
                  }),
              Center(
                child: ElevatedButton(
                    child: Container(
                      width: 30,
                      height: 30,
                      color: ui.textColor,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: ui.textColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                paletteType: PaletteType.hueWheel,
                                pickerColor: ui.textColor,
                                onColorChanged: (color) {
                                  ui.textColor = color;
                                },
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('Got it'),
                                onPressed: () {
                                  print("I am current Color got it");
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        })),
              ),
            ],
          ));
    });
  }
}
