import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  final Locale locale;

  const ContactScreen({super.key, required this.locale});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';

  bool _submitted = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _submitted = true;
      });

      // Ici tu peux ajouter un appel API ou envoi mail

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _submitted = false;
        });
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFR = widget.locale.languageCode == 'fr';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: _submitted
          ? Center(
              child: Text(
                isFR ? 'Merci pour votre message !' : 'Thank you for your message!',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
            )
          : Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: isFR ? 'Nom' : 'Name',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return isFR ? 'Veuillez entrer votre nom' : 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => name = value!.trim(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return isFR ? 'Veuillez entrer votre email' : 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return isFR ? 'Email invalide' : 'Invalid email';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value!.trim(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: isFR ? 'Message' : 'Message',
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return isFR ? 'Veuillez entrer un message' : 'Please enter a message';
                      }
                      return null;
                    },
                    onSaved: (value) => message = value!.trim(),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(isFR ? 'Envoyer' : 'Send'),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.linked_camera),
                        color: Colors.purple,
                        onPressed: () {
                          // Ouvrir LinkedIn
                        },
                        tooltip: 'LinkedIn',
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.purple,
                        onPressed: () {
                          // Ouvrir Instagram
                        },
                        tooltip: 'Instagram',
                      ),
                      IconButton(
                        icon: const Icon(Icons.web),
                        color: Colors.purple,
                        onPressed: () {
                          // Ouvrir landing page
                        },
                        tooltip: 'Landing Page',
                      ),
                      IconButton(
                        icon: const Icon(Icons.code),
                        color: Colors.purple,
                        onPressed: () {
                          // Ouvrir GitHub
                        },
                        tooltip: 'GitHub',
                      ),
                      IconButton(
                        icon: const Icon(Icons.phone),
                        color: Colors.purple,
                        onPressed: () {
                          // Appeler le numéro
                        },
                        tooltip: isFR ? 'Téléphone' : 'Phone',
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
