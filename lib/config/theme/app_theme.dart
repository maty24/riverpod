import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {
  //el themeData es el que se encarga de darle el estilo a la app, es prioprio de flutter
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(iconColor: seedColor),
        //cambio el tipo de letra globalmente
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates(),
          //el font size es el tamaño de la letra
          titleMedium: GoogleFonts.montserrat(fontSize: 26)
        )
      );
}
