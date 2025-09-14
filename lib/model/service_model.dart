import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom Colors
const primaryColor = Colors.white;
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF000515);

// Service Model
class Service {
  final String title;
  final IconData icon;
  final String description;
  final Color accentColor;

  Service({
    required this.title,
    required this.icon,
    required this.description,
    required this.accentColor,
  });
}
