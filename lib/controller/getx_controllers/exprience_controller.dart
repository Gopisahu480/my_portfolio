import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/experience_model.dart';

class ExperienceController extends GetxController
    with GetTickerProviderStateMixin {
  var selectedExperience = 0.obs;
  var isExpanded = false.obs;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  final List<Experience> experiences = [
    Experience(
      company: "Indian Institute of Technology (IIT) Bhilai",
      position: "Software Developer",
      duration: "Oct 2024 – Present",
      location: "Bhilai, India",
      companyColor: Colors.blue,
      companyIcon: Icons.school,
      responsibilities: [
        "Spearheading the development of advanced software solutions using Flutter, React, Node.js, and SQL",
        "Integrated third-party APIs to enhance the functionality of internal applications and streamline processes",
        "Working on various government-funded projects, focusing on development and implementation for large-scale systems",
        "Collaborating with cross-functional teams to ensure smooth execution of government project deliverables",
        "Conducted code reviews and performance optimizations to ensure high standards of quality and reliability"
      ],
    ),
    Experience(
      company: "Fixing Dots Technology",
      position: "Software Developer",
      duration: "Nov 2022 – Oct 2024",
      location: "Raipur Chhattisgarh",
      companyColor: Colors.green,
      companyIcon: Icons.business,
      responsibilities: [
        "Developed cross-platform apps for iOS and Android using Flutter with clean and efficient code",
        "Collaborated on design, development, and integration of APIs, handling dashboard, navbar, and role management",
        "Integrated and verified data using Flutter, PHP Laravel, and RESTful APIs",
        "Utilized GetX, Bloc, and Provider packages for effective state management",
        "Managed data efficiently using Firebase Firestore and MySQL, improving performance"
      ],
    ),
    Experience(
      company: "Jspider BTM Layout",
      position: "Java Full Stack Developer Intern",
      duration: "Jan 2022 – Nov 2022",
      location: "Bangalore, India",
      companyColor: Colors.orange,
      companyIcon: Icons.code,
      responsibilities: [
        "Designed, developed, and maintained department website ensuring intuitive user interface",
        "Implemented user interfaces and front-end functionalities for seamless user experience",
        "Worked with Java full-stack technologies and modern web development practices"
      ],
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutCubic,
    ));

    animationController.forward();
  }

  void selectExperience(int index) {
    selectedExperience.value = index;
    animationController.reset();
    animationController.forward();
  }

  void toggleExpanded() {
    isExpanded.toggle();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
