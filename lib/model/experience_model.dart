import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Model for Experience
class Experience {
  final String company;
  final String position;
  final String duration;
  final String location;
  final List<String> responsibilities;
  final Color companyColor;
  final IconData companyIcon;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.responsibilities,
    required this.companyColor,
    required this.companyIcon,
  });
}