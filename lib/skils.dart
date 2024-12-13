import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Tools'),
          const SkillsList([
            'Xcode',
            'Figma',
            'Postman',
            'Adobe XD',
            'TestFlight',
            'Flutter Flow',
            'Git/GitHub',
          ]),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Programming Languages'),
          const SkillsList(['C++', 'Dart', 'Java']),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Technologies'),
          const SkillsList(['Flutter']),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Core Skills'),
          const SkillsList([
            'Object-Oriented Programming (OOP)',
            'RESTful APIs',
            'MVVM Architecture',
            'SOLID Principles',
            'State Management: BLoC, Provider',
            'Cross-Platform Deployment: Android & iOS',
          ]),
          const SizedBox(height: 16),
          const SectionHeader(title: 'UI/UX Skills'),
          const SkillsList([
            'Responsive UI Design',
            'Localization',
            'UI/UX Development',
          ]),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Backend & Cloud'),
          const SkillsList([
            'Firebase Services:',
            'Firestore',
            'Authentication',
            'Cloud Functions',
            'FCM',
            'Hosting',
            'Realtime Database',
          ]),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Other Key Skills'),
          const SkillsList([
            'Agile Methodologies',
            'Payments Integration',
            'Data Structures',
          ]),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }
}

class SkillsList extends StatelessWidget {
  final List<String> skills;

  const SkillsList(this.skills, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills
          .map((skill) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        skill,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
