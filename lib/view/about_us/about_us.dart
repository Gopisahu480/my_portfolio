import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/getx_controllers/about_controller.dart';
import 'package:my_portfolio/model/statistic_model.dart';
import '../../model/service_model.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AboutController controller = Get.put(AboutController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 900;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
        decoration: const BoxDecoration(color: bgColor),
        child: AnimatedBuilder(
          animation: controller.fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: controller.fadeAnimation.value,
              child: Transform.translate(
                offset: Offset(0, controller.slideAnimation.value),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(),
                    SizedBox(height: isSmallScreen ? 32 : 48),
                    isSmallScreen
                        ? Column(
                            children: [
                              _buildAboutContent(),
                              const SizedBox(height: 40),
                              _buildServicesSection(controller),
                              const SizedBox(height: 40),
                              _buildStatisticsSection(controller),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    _buildAboutContent(),
                                    const SizedBox(height: 40),
                                    _buildServicesSection(controller),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 40),
                              Expanded(
                                flex: 1,
                                child: _buildStatisticsSection(controller),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Me',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          width: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF64FFDA), Color(0xFF00BCD4)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutContent() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: const Color(0xFF64FFDA).withOpacity(0.2), width: 1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I am a passionate software developer who enjoys creating solutions from scratch and turning ideas into reality. My journey in this field is driven by a constant desire to learn, experiment, and improve. I believe software development is not just about writing code, but about solving problems and building meaningful applications that make a difference. I enjoy working across different technologies, exploring both front-end and back-end, and continuously sharpening my skills. For me, development is a creative process that combines logic, design, and innovation into something impactful.",
            style: TextStyle(
              fontSize: 16,
              color: bodyTextColor,
              height: 1.6,
              letterSpacing: 0.5,
            ),
          ),
          // SizedBox(height: 20),
          // Text(
          //   "My passion lies in creating innovative solutions that bridge the gap between complex technology and user-friendly experiences. I believe in continuous learning and adapting to new technologies to deliver the best results.",
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: bodyTextColor,
          //     height: 1.6,
          //     letterSpacing: 0.5,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(AboutController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What I Do',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        const SizedBox(height: 24),
        Column(
          children: controller.services.map((service) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: _buildServiceCard(service),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildServiceCard(Service service) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: service.accentColor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: service.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(service.icon, color: service.accentColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  service.description,
                  style: const TextStyle(
                      fontSize: 14, color: bodyTextColor, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection(AboutController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Achievements',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        const SizedBox(height: 24),
        Column(
          children: [
            _buildStatCard(
                controller.completedProjects, controller.statistics[0]),
            const SizedBox(height: 20),
            _buildStatCard(
                controller.clientSatisfaction, controller.statistics[1]),
            const SizedBox(height: 20),
            _buildStatCard(
                controller.yearsExperience, controller.statistics[2]),
          ],
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () => controller.restartAnimation(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF64FFDA), Color(0xFF00BCD4)]),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh, color: darkColor, size: 18),
                SizedBox(width: 8),
                Text(
                  'Restart Animation',
                  style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(RxInt value, Statistic stat) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: stat.accentColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Obx(() => RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: value.value.toString(),
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: stat.accentColor),
                    ),
                    TextSpan(
                      text: stat.suffix,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: stat.accentColor),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 8),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: bodyTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
