import 'package:flutter/material.dart';

abstract class AppColors {
  // ===== Base =====
  static const background = Color(0xFFE1E9FB);
  static const cardBackground = Color(0xFFE0E0E0); // Colors.grey[200]

  // light
  //static const background = Color(0xFFDFE7F4);
  static const primary = Color(0xFF2F6BFF);
  static const buttonAccent = Color(0xA98DAEEF);

  // like design
  //static const background = Color(0xFFE9F1FC);

  static const light = Colors.white;
  static const redAccent = Colors.red;
  static const dark = Color(0xFF000000);

  static const textDark = Color(0xFF1C1C1E);
  static const textLight = Colors.white;
  static const textMedium = Color(0xFF7A818F);
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
  static const paymentBorderInactive = Color(0xFF9E9E9E);

  // ===== Payment / Credit Card =====
  static const creditCardText = Colors.white;
  static const creditCardLabel = Color(0xCCFFFFFF); // white with 0.8 opacity
  static const creditCardShadow = Color(0x4D2F6BFF); // primary with opacity

  // ===== Divider (OR) =====
  static const dividerLine = Color(0xFFACABAB);
  static const dividerText = Color(0xFF757474);

  // ===== Card Logos =====
  static const mastercardLeft = Colors.red;
  static const mastercardRight = Colors.amber;

  // ===== Add Credit Card Button =====
  static const addCardBorder = Color(0xFF8EA7D1);
  static const addCardText = Color(0xFF5B8DEF);
  static const addCardIcon = Color(0xFF5B8DEF);
}