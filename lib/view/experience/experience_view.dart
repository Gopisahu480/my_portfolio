import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/getx_controllers/exprience_controller.dart'; // Assuming GetX is used

const primaryColor = Colors.white;
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF000515);

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExperienceController controller = Get.put(ExperienceController());
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgColor, bgColor],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            _buildSectionHeader(),
            SizedBox(height: screenWidth * 0.08),
            // Experience Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Experience Timeline Stepper
                Flexible(
                  flex: 1,
                  child: _buildExperienceTimeline(controller),
                ),
                SizedBox(width: screenWidth * 0.05),
                // Experience Details
                Flexible(
                  flex: 2,
                  child: _buildExperienceDetails(controller),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Professional Experience',
          style: TextStyle(
            fontSize: 28, // Reduced for smaller screens
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
              colors: [darkColor, bodyTextColor],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'My journey through different roles and technologies',
          style: TextStyle(
            fontSize: 16,
            color: bodyTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceTimeline(ExperienceController controller) {
    return Obx(() => SingleChildScrollView(
          child: Column(
            children: List.generate(controller.experiences.length, (index) {
              final experience = controller.experiences[index];
              final isSelected = controller.selectedExperience.value == index;

              return GestureDetector(
                onTap: () => controller.selectExperience(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      // Timeline indicator
                      Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: isSelected ? 16 : 12,
                            height: isSelected ? 16 : 12,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? experience.companyColor
                                  : bodyTextColor,
                              shape: BoxShape.circle,
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: experience.companyColor
                                            .withOpacity(0.4),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : [],
                            ),
                          ),
                          if (index < controller.experiences.length - 1)
                            Container(
                              width: 2,
                              height: 80,
                              color: bodyTextColor.withOpacity(0.5),
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Company info
                      Flexible(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? experience.companyColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: darkColor.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    experience.companyIcon,
                                    color: experience.companyColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      experience.company,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: isSelected
                                            ? secondaryColor
                                            : bodyTextColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                experience.position,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: experience.companyColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                experience.duration,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: bodyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }

  Widget _buildExperienceDetails(ExperienceController controller) {
    return Obx(() {
      final selectedExp =
          controller.experiences[controller.selectedExperience.value];

      return AnimatedBuilder(
        animation: controller.fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: controller.fadeAnimation,
            child: SlideTransition(
              position: controller.slideAnimation,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: darkColor.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selectedExp.companyColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            selectedExp.companyIcon,
                            color: selectedExp.companyColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedExp.company,
                                style: TextStyle(
                                  fontSize: 20, // Reduced for smaller screens
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                selectedExp.position,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedExp.companyColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Duration and location
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: bgColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.schedule,
                                  size: 16, color: bodyTextColor),
                              const SizedBox(width: 6),
                              Text(
                                selectedExp.duration,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: bodyTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: bgColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: bodyTextColor),
                              const SizedBox(width: 6),
                              Text(
                                selectedExp.location,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: bodyTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Responsibilities
                    Text(
                      'Key Responsibilities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...selectedExp.responsibilities.map((responsibility) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: selectedExp.companyColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                responsibility,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: bodyTextColor,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
