import 'package:flutter/material.dart';
import 'package:myportfolio/composnents/service_card.dart';
import '../models/service.dart';

class ServicesScreen extends StatelessWidget {
  final Locale locale;

  ServicesScreen({super.key, required this.locale});

  final List<Service> services = [
    Service(
      title: 'Développement Mobile',
      descriptionFR: 'Création d\'applications mobiles sur mesure en Flutter.',
      descriptionEN: 'Custom mobile app development with Flutter.',
      imageUrl: 'assets/images/mobile_dev.png',
    ),
    Service(
      title: 'Design UI/UX',
      descriptionFR: 'Design d\'interfaces modernes et intuitives.',
      descriptionEN: 'Design of modern and intuitive user interfaces.',
      imageUrl: 'assets/images/uiux.png',
    ),
    Service(
      title: 'Consulting Tech',
      descriptionFR: 'Conseils techniques et accompagnement de projets.',
      descriptionEN: 'Technical consulting and project guidance.',
      imageUrl: 'assets/images/consulting.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isFR = locale.languageCode == 'fr';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(service: service, isFR: isFR);
        },
      ),
    );
  }
}
