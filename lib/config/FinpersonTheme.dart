import 'package:flutter/material.dart';
import 'package:Finperson/config/colors.dart';

final ThemeData finpersonTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(7.0)),
        // ),
        colorScheme: ColorScheme.light().copyWith(primary: primaryColor)),
    scaffoldBackgroundColor: colorSurface,
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: colorSurface),
    backgroundColor: backgroundWhite,
    primaryColorLight: lightColor,
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline2:
        base.headline2.copyWith(fontSize: 20.0, fontFamily: 'Roboto-regular'),
    headline3: base.headline3.copyWith(fontSize: 24.0, fontFamily: 'Eczar'),
    headline4: base.headline4.copyWith(
        fontSize: 20.0, fontFamily: 'Roboto-bold', letterSpacing: 1.5),
    headline5: base.headline5.copyWith(fontSize: 18.0, fontFamily: 'Eczar'),
    headline6: base.headline6.copyWith(
        fontSize: 14.0, fontFamily: 'Roboto-regular', letterSpacing: 1.5),
    subtitle1:
        base.subtitle1.copyWith(fontSize: 16.0, fontFamily: 'Roboto-regular'),
    subtitle2:
        base.subtitle2.copyWith(fontSize: 14.0, fontFamily: 'Roboto-regular'),
    bodyText1: base.bodyText1.copyWith(fontSize: 16.0, fontFamily: 'Eczar'),
    bodyText2:
        base.bodyText2.copyWith(fontSize: 20.0, fontFamily: 'Eczar-bold'),
    caption:
        base.caption.copyWith(fontSize: 12.0, fontFamily: 'Roboto-regular'),
    button: base.button.copyWith(fontSize: 14.0, fontFamily: 'Roboto-bold'),
    overline:
        base.overline.copyWith(fontSize: 10.0, fontFamily: 'Roboto-regular'),
  );
}
