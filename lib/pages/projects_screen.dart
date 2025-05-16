import 'package:flutter/material.dart';
import 'package:myportfolio/composnents/project_card.dart';
import '../models/project.dart';

class ProjectsScreen extends StatelessWidget {
  final Locale locale;

   ProjectsScreen({super.key, required this.locale});

  final List<Project> projects = [
    Project(
      title: 'Portfolio Flutter',
      descriptionFR: 'Un portfolio réalisé avec Flutter, supportant thème clair/sombre et multilingue.',
      descriptionEN: 'A Flutter portfolio app supporting light/dark themes and multilingual features.',
      date: '2025-05-01',
      duration: '2 mois',
      technologies: ['Flutter', 'Dart', 'Provider'],
      imageUrl: 'assets/images/portfolio_flutter.png',
    ),
    Project(
      title: 'Site Web E-commerce',
      descriptionFR: 'Site e-commerce responsive avec gestion de panier et paiement.',
      descriptionEN: 'Responsive e-commerce website with cart management and payment integration.',
      date: '2024-12-15',
      duration: '3 mois',
      technologies: ['React', 'Node.js', 'MongoDB'],
      imageUrl: 'assets/images/ecommerce_site.png',
    ),
    // Ajoute ici d'autres projets si tu veux
  ];

  @override
  Widget build(BuildContext context) {
    final isFR = locale.languageCode == 'fr';

    return Scaffold(
      appBar: AppBar(
        title: Text(isFR ? 'Projets Réalisés' : 'Completed Projects'),
      ),
      body: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: projects.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final project = projects[index];
            return ProjectCard(project: project, isFR: isFR);
          },
        ),
      ),
    );
  }
}
