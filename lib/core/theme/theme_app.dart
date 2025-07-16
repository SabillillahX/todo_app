import 'package:flutter/material.dart';

class ThemeApp {
  // Static method untuk light theme
  static ThemeData lightTheme() {
    return ThemeData(
      // Menggunakan ColorScheme untuk theme yang lebih modern
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.yellow, // Warna utama sebagai base
        brightness: Brightness.light, // Light theme
      ),
      
      // AppBar Theme - styling untuk semua AppBar di app
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white, // Warna text dan icon
        elevation: 4,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // Scaffold Theme - background default untuk semua Scaffold
      scaffoldBackgroundColor: Colors.yellow[200],
      
      // Card Theme - styling untuk Card widgets
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // Text Theme - styling untuk berbagai jenis text
      fontFamily: 'Poppins', // Menggunakan font Poppins
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: Colors.deepPurple[800],
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Colors.deepPurple[700],
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      
      // Input Decoration Theme - styling untuk TextField
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black12, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black12, width: 2),
        ),
      ),
      
      // FloatingActionButton Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    );
  }

  // Static method untuk dark theme (bonus)
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}