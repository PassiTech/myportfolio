import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            child: const Text(
              "À propos",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => scrollTo(educationKey),
            child: const Text(
              "Éducation",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => scrollTo(projectsKey),
            child: const Text("Projets", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => scrollTo(certificationKey),
            child: const Text(
              "Certifications",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => scrollTo(contactKey),
            child: const Text("Contact", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
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
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
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
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "- Baccalauréat scientifique option C, 2020\n  Lycée bilingue de Nyalla",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "- Brevet de Technicien option Génie Logiciel, 2023\n  IUC",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "- Bachelor Degree in Software Engineering, 2024\n  IUC",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "- Formation Data Analytics, Mars-Mai 2025\n  Afrilabs",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mes Projets",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const VideoProjectCard(
                          title: "Bricoleur.cm",
                          description:
                              "Marketplace pour bricoleurs. Les techniciens s’inscrivent et offrent leurs services en ligne.",
                          videoAsset: "assets/videos/lebricoleur.mp4",
                          imageUrls: [
                            "assets/images/login-bricoleur.jpg",
                            "assets/images/register-bricoleur.jpg",
                            "assets/images/home_bricoleur.jpg",
                            "assets/images/detail-bricoleur.jpg",
                            "assets/images/profile.jpg",
                          ],
                        ),
                        projectCard(
                          title: "Foodie App",
                          description:
                              "Application mobile de gestion de restaurant avec paiement mobile, notifications, et interface Flutter.",
                          imageUrls: [
                            "assets/images/Login-page.png",
                            "assets/images/Home-page-1.png",
                            "assets/images/edit-profile.png",
                            "assets/images/Cart-Page.png",
                            "assets/images/Cart-Page-1.png",
                          ],
                        ),
                        projectCard(
                          title: "Ecommerce 237",
                          description:
                              "Site e-commerce en Flutter + Python pour la vente de vêtements avec paiement intégré.",
                          imageUrls: [
                            "assets/images/login-market.png",
                            "assets/images/create-account-market.png",
                            "assets/images/image-search-market.png",
                            "assets/images/My-Activity-ecom.png",
                            "assets/images/history-market.png",
                          ],
                        ),
                        projectCard(
                          title: "ImmoShare",
                          description:
                              "Application web PWA de location de logements. Vue.js + backend Django.",
                          imageUrls: [
                            "assets/images/02_Create_Account.png",
                            "assets/images/03_Home_Page.png",
                            "assets/images/04_Product_Detail.png",
                            "assets/images/05_Cart.png",
                          ],
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
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        certificationItem(
                          title: "Data Analytics Essentials",
                          organization: "Cisco",
                          year: "2025",
                          imagePath: "assets/images/data_analytics_certif.png",
                        ),
                        certificationItem(
                          title: "Introduction to Data Science",
                          organization: "Cisco",
                          year: "2025",
                          imagePath: "assets/images/introductio_data_science.png",
                        ),
                        certificationItem(
                          title: "Introduction to Python",
                          organization: "Cisco",
                          year: "2025",
                          imagePath: "assets/images/python_essential_certif.png",
                        ),
                      ],
                    ),
                  ),

                  // ...existing code...
                // Contact
                Container(
                  key: contactKey,
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 16),
                      ContactForm(), // <-- Ajoute simplement ce widget ici
                    
                      const Footer()
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget projectCard({
  required String title,
  required String description,
  required List<String> imageUrls,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 400, // Hauteur plus grande pour les images
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrls[index],
                  width: 320,  // Largeur plus grande pour l’image
                  height: 0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
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
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 400,
            height: 350,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$organization - $year",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message envoyé avec succès !')),
      );
      _formKey.currentState!.reset();
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
            decoration: const InputDecoration(
              labelText: "Nom",
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value == null || value.isEmpty ? "Veuillez entrer votre nom" : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer votre email";
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value)) {
                return "Veuillez entrer un email valide";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: "Message",
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
            validator: (value) =>
                value == null || value.isEmpty ? "Veuillez entrer un message" : null,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              "Envoyer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
  final List<String> imageUrls;

  const VideoProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.videoAsset,
    required this.imageUrls,
  });

  @override
  State<VideoProjectCard> createState() => _VideoProjectCardState();
}

class _VideoProjectCardState extends State<VideoProjectCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple, 
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (_controller.value.isInitialized)
              SizedBox(
                width: 400,  // même largeur que les images
                height: 280,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: VideoPlayer(_controller),
                ),
              )
            else
              const SizedBox(
                width: 320,
                height: 280,
                child: Center(child: CircularProgressIndicator()),
              ),
            const SizedBox(height: 12),
            Text(widget.description),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.imageUrls.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imageUrls[index],
                    width: 320,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Footer extends StatelessWidget {
  const Footer({super.key});

  // Fonction pour ouvrir un lien
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Impossible d’ouvrir le lien : $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "© 2025 Mon Portfolio - Tous droits réservés",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _launchUrl("mailto:noubissiepascaline02@gmail.com"),
            child: const Text(
              "📧 Email : noubissiepascaline02@gmail.com",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _launchUrl("tel:+237655354265"),
            child: const Text(
              "📱 Téléphone : +237 655354265",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _launchUrl("https://www.linkedin.com/in/pascaline-noubissie-208b80241"),
            child: const Text(
              "🔗 LinkedIn : www.linkedin.com/in/pascaline-noubissie-208b80241",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


