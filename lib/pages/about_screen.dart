import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final Locale locale;

  const AboutScreen({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final isFR = locale.languageCode == 'fr';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile.jpg'), // À remplacer par ta photo
          ),
          const SizedBox(height: 16),
          Text(
            isFR ? 'Pascaline Passi' : 'Pascaline Passi',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            isFR
                ? 'Développeuse Flutter passionnée avec expérience dans des projets comme Foodie, Bricoleur, et plus. J’aime créer des applications intuitives et belles.'
                : 'Passionate Flutter developer experienced in projects like Foodie, Bricoleur, and more. I enjoy creating intuitive and beautiful apps.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.purple.shade300),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.email, 'Email', 'pascaline@example.com'),
          _buildInfoRow(Icons.phone, 'Phone', '+237 123 456 789'),
          _buildInfoRow(Icons.location_on, 'Location', 'Douala, Cameroun'),
          const SizedBox(height: 24),
          Text(
            isFR ? 'Compétences' : 'Skills',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _skillChip('Flutter'),
              _skillChip('Dart'),
              _skillChip('Firebase'),
              _skillChip('Git'),
              _skillChip('REST API'),
              _skillChip('Scrum'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 10),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _skillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.purple.shade100,
      labelStyle: const TextStyle(color: Colors.purple),
    );
  }
}
