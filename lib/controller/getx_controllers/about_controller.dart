import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/service_model.dart';
import 'package:my_portfolio/model/statistic_model.dart';

class AboutController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController fadeController;
  late AnimationController counterController;
  late Animation<double> fadeAnimation;
  late Animation<double> slideAnimation;

  // Statistics with animated counters
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
      value: "15",
      label: "Completed\nProjects",
      suffix: "+",
      accentColor: const Color(0xFF64FFDA),
    ),
    Statistic(
      value: "75",
      label: "Client\nsatisfaction",
      suffix: "%",
      accentColor: const Color(0xFF00BCD4),
    ),
    Statistic(
      value: "3",
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

    // Start animations
    fadeController.forward();
    _animateCounters();
  }

  void _animateCounters() {
    counterController.forward();

    // Animate completed projects
    final projectTween = IntTween(begin: 0, end: 120);
    final projectAnimation = projectTween.animate(CurvedAnimation(
      parent: counterController,
      curve: Curves.easeOut,
    ));

    // Animate client satisfaction
    final satisfactionTween = IntTween(begin: 0, end: 95);
    final satisfactionAnimation = satisfactionTween.animate(CurvedAnimation(
      parent: counterController,
      curve: Curves.easeOut,
    ));

    // Animate years experience
    final yearsTween = IntTween(begin: 0, end: 10);
    final yearsAnimation = yearsTween.animate(CurvedAnimation(
      parent: counterController,
      curve: Curves.easeOut,
    ));

    projectAnimation.addListener(() {
      completedProjects.value = projectAnimation.value;
    });

    satisfactionAnimation.addListener(() {
      clientSatisfaction.value = satisfactionAnimation.value;
    });

    yearsAnimation.addListener(() {
      yearsExperience.value = yearsAnimation.value;
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
