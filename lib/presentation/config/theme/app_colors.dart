import 'package:flutter/material.dart';

abstract class AppColors {
  // ===== Base =====
  static const background = Color(0xFFE1E9FB);
  static const primary = Color(0xFF2F6BFF);

  static const cardLight = Colors.white;
  static const redAccent = Colors.red;

  static const textDark = Color(0xFF1C1C1E);
  static const textLight = Colors.white;
  static const textMuted = Colors.grey;

  static const border = Color(0xFFD6DEF3);

  // ===== Onboarding =====
  static const overlayDark1 = Color(0x66000000);
  static const overlayDark2 = Color(0xDD000000);

  // ===== Navigation =====
  static const navBarBackground = Color(0xFF0F0F10);
  static const navItemInactive = Color(0xFF1C1C1E);
  static const navItemActive = Color(0xFF2F6BFF);
  static const navIcon = Colors.white;

  // ===== Greeting Header =====
  static const greetingSubtitle = Color(0xFF9E9E9E);

  // ===== Payment =====
  static const paymentBackground = Color(0xFFE0E0E0); // Colors.grey[200]
  static const paymentAccent = Color(0xFF5B8DEF);
  static const paymentAccentDark = Color(0xFF4A7FE8);
  static const paymentBorderInactive = Color(0xFF9E9E9E);

  // ===== Payment / Credit Card =====
  static const creditCardGradientStart = Color(0xFF5B8DEF);
  static const creditCardGradientEnd = Color(0xFF4A7FE8);

  static const creditCardText = Colors.white;
  static const creditCardLabel = Color(0xCCFFFFFF); // white with 0.8 opacity
  static const creditCardShadow = Color(0x4D5B8DEF);

  // ===== Divider (OR) =====
  static const dividerLine = Color(0xFFACABAB);
  static const dividerText = Color(0xFF757474);

  // ===== Card Logos =====
  static const mastercardLeft = Colors.red;
  static const mastercardRight = Colors.amber;


}