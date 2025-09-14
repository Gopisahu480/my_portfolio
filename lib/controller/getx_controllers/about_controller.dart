import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/service_model.dart';
import 'package:my_portfolio/model/statistic_model.dart';

class AboutController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController fadeController;
  late AnimationController counterController;
  late Animation<double> fadeAnimation;
  late Animation<double> slideAnimation;

  // Animated counters
  var completedProjects = 0.obs;
  var clientSatisfaction = 0.obs;
  var yearsExperience = 0.obs;

  final List<Service> services = [
    Service(
      title: "Website Development",
      icon: Icons.web,
      description:
          "Creating responsive and modern web applications using latest technologies",
      accentColor: const Color(0xFF64FFDA),
    ),
    Service(
      title: "App Development",
      icon: Icons.mobile_friendly,
      description:
          "Building cross-platform mobile apps with Flutter for iOS and Android",
      accentColor: const Color(0xFF00BCD4),
    ),
    Service(
      title: "Website Hosting",
      icon: Icons.cloud,
      description:
          "Reliable hosting solutions and deployment services for your applications",
      accentColor: const Color(0xFFFF6B6B),
    ),
  ];

  final List<Statistic> statistics = [
    Statistic(
      value: "0",
      label: "Completed\nProjects",
      suffix: "+",
      accentColor: const Color(0xFF64FFDA),
    ),
    Statistic(
      value: "0",
      label: "Client\nsatisfaction",
      suffix: "%",
      accentColor: const Color(0xFF00BCD4),
    ),
    Statistic(
      value: "0",
      label: "Years of\nexperience",
      suffix: "+",
      accentColor: const Color(0xFFFF6B6B),
    ),
  ];

  @override
  void onInit() {
    super.onInit();

    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    counterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeInOut,
    ));

    slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeOutCubic,
    ));

    fadeController.forward();
    _animateCounters();
  }

  void _animateCounters() {
    counterController.forward(from: 0);

    // Completed Projects
    IntTween(begin: 0, end: 15)
        .animate(
            CurvedAnimation(parent: counterController, curve: Curves.easeOut))
        .addListener(() {
      completedProjects.value = (15 * counterController.value).toInt();
    });

    // Client Satisfaction
    IntTween(begin: 0, end: 85)
        .animate(
            CurvedAnimation(parent: counterController, curve: Curves.easeOut))
        .addListener(() {
      clientSatisfaction.value = (85 * counterController.value).toInt();
    });

    // Years Experience
    IntTween(begin: 0, end: 3)
        .animate(
            CurvedAnimation(parent: counterController, curve: Curves.easeOut))
        .addListener(() {
      yearsExperience.value = (3 * counterController.value).toInt();
    });
  }

  void restartAnimation() {
    counterController.reset();
    _animateCounters();
  }

  @override
  void onClose() {
    fadeController.dispose();
    counterController.dispose();
    super.onClose();
  }
}
