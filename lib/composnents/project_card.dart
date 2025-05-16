import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isFR;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isFR,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () {
            // Tu peux ajouter une navigation vers une page détail ici si tu veux
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du projet
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    project.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                // Titre
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                ),
                const SizedBox(height: 6),
                // Description (selon langue)
                Text(
                  isFR ? project.descriptionFR : project.descriptionEN,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                // Infos supplémentaires : date, durée, technos
                Text(
                  isFR
                      ? 'Date : ${project.date}'
                      : 'Date: ${project.date}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  isFR
                      ? 'Durée : ${project.duration}'
                      : 'Duration: ${project.duration}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: project.technologies
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor: Colors.purple.shade50,
                          labelStyle: const TextStyle(color: Colors.purple),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
