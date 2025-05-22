import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final VoidCallback toggleLanguage;
  final Locale locale;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.toggleLanguage,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final aboutKey = GlobalKey();
    final educationKey = GlobalKey();
    final projectsKey = GlobalKey();
    final certificationKey = GlobalKey();
    final contactKey = GlobalKey();

    void scrollTo(GlobalKey key) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Mon Portfolio"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
            tooltip: "Changer le thème",
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: toggleLanguage,
            tooltip: "Changer la langue",
          ),
          TextButton(
            onPressed: () => scrollTo(aboutKey),
            child: const Text("À propos", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollTo(educationKey),
            child: const Text("Éducation", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollTo(projectsKey),
            child: const Text("Projets", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollTo(certificationKey),
            child: const Text("Certifications", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollTo(contactKey),
            child: const Text("Contact", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          color: isDarkMode ? Colors.black : Colors.white,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // À propos
              Container(
                key: aboutKey,
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "À propos de moi",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Je suis une jeune développeuse passionnée par la technologie, spécialisée en développement logiciel et en data analytics. Titulaire d’un Bachelor of Technology en Software Engineering, j’ai conçu des applications comme Foodie (gestion de restaurant) et ImmoShare (location de logements). J’ai aussi suivi une formation intensive de 6 mois en data analytics et travaillé sur des projets de nettoyage et visualisation de données avec Power BI.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              // Éducation
              Container(
                key: educationKey,
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Éducation",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "- Baccalauréat scientifique option C, 2020\n  Lycée bilingue de Nyalla",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "- Brevet de Technicien option Génie Logiciel, 2023\n  Institut Universitaire de la Côte",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "- Bachelor Degree in Software Engineering, 2024\n  Institut Universitaire de la Côte",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "- Formation Data Analytics, Mars à Mai 2025\n  Afrilabs",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              // Projets
              Container(
                key: projectsKey,
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  children: [
                    const Text(
                      "Mes Projets",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    const SizedBox(height: 16),
                    projectCard(
                      title: "Foodie App",
                      description:
                          "Application mobile pour la gestion de restaurants avec notifications de paiement, interface intuitive, et intégration mobile money.",
                      imageUrl: 'assets/images/01_Start.png',
                    ),
                    projectCard(
                      title: "ImmoShare",
                      description:
                          "PWA de location de logements avec filtres dynamiques, design moderne et responsive en Vue.js.",
                      imageUrl: 'assets/images/02_Create_Account.png',
                    ),
                    projectCard(
                      title: "VestiLux",
                      description:
                          "Site e-commerce pour vêtements avec Flutter frontend, backend Python, gestion des commandes et paiement en ligne.",
                      imageUrl: 'assets/images/01_Start.png',
                    ),
                    // Ici on remplace projectCard par VideoProjectCard
                    const VideoProjectCard(
                      title: "Bricoleur.cm",
                      description:
                          "Marketplace de services de bricolage avec inscription de techniciens, géolocalisation et gestion de profils.",
                      videoAsset: 'assets/videos/bricoleur_demo.mp4',
                    ),
                  ],
                ),
              ),

              // Certifications
              Container(
                key: certificationKey,
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Certifications",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    const SizedBox(height: 16),
                    certificationItem(
                      title: "Data Analytics Essentials",
                      organization: "Cisco",
                      year: "",
                      imagePath: "assets/images/data_analytics_certif.png",
                    ),
                    certificationItem(
                      title: "Introduction to Data Science",
                      organization: "Cisco",
                      year: "",
                      imagePath: "assets/images/introductio_data_science.png",
                    ),
                    certificationItem(
                      title: "Introduction to Python",
                      organization: "Cisco",
                      year: "",
                      imagePath: "assets/images/python_essential_certif.png",
                    ),
                    certificationItem(
                      title: "Using Computer and Mobile Devices",
                      organization: "Cisco",
                      year: "",
                      imagePath: "assets/images/using_computer_certif.png",
                    ),
                  ],
                ),
              ),

              // Contact
              Container(
                key: contactKey,
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    const SizedBox(height: 16),
                    const Text("📧 Email : noubissiepascaline02@gmail.com"),
                    const Text("📱 Téléphone : +237 655354265"),
                    const Text("🔗 LinkedIn : www.linkedin.com/in/pascaline-noubissie-208b80241"),
                    const SizedBox(height: 24),
                    const Text("Envoyez-moi un message :", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const ContactForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectCard({required String title, required String description, required String imageUrl}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Image.asset(imageUrl, height: 180, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(description),
          ],
        ),
      ),
    );
  }

  Widget certificationItem({
    required String title,
    required String organization,
    required String year,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 348,
            height: 548,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 3),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(text: "$title\n", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "$organization $year"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String videoAsset;

  const VideoProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.videoAsset,
  });

  @override
  State<VideoProjectCard> createState() => _VideoProjectCardState();
}

class _VideoProjectCardState extends State<VideoProjectCard> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {}); // pour rafraîchir l'UI une fois la vidéo chargée
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_controller),
                        if (!_isPlaying)
                          IconButton(
                            icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white70),
                            onPressed: _togglePlayPause,
                          )
                        else
                          GestureDetector(
                            onTap: _togglePlayPause,
                            child: Container(
                              color: Colors.transparent,
                            ),
                          )
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
            const SizedBox(height: 12),
            Text(widget.description),
          ],
        ),
      ),
    );
  }
}

// Formulaire de contact (simple)
class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Ici, tu peux traiter l'envoi du message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message envoyé !')),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nom'),
            validator: (value) => value == null || value.isEmpty ? 'Veuillez entrer votre nom' : null,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Veuillez entrer votre email';
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value)) return 'Veuillez entrer un email valide';
              return null;
            },
          ),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(labelText: 'Message'),
            maxLines: 3,
            validator: (value) => value == null || value.isEmpty ? 'Veuillez entrer un message' : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Envoyer'),
          ),
        ],
      ),
    );
  }
}
