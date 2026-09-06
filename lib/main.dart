import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4B4FC4),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4B4FC4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4B4FC4),
            foregroundColor: Colors.white,
            minimumSize: const Size(200, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4B4FC4),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final radius = width < 400 ? 50.0 : 60.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 55, 24, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: const Color(0xFFE4D9FA),
            ),
            const SizedBox(height: 20),
            const Text(
              'YJS RAGHAVENDRA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Color(0xFF4B4FC4),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'B.Tech 3rd Year · Computer Science-AIML',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About Me'),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              child: const Text('Projects'),
            ),
            const SizedBox(height: 22),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.email_outlined, size: 18),
              label: const Text('raghavendra@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 35, 20, 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE7E8F7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 42,
                    color: Color(0xFF4B4FC4),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Hello! I'm YJS Raghavendra, currently pursuing "
                    "my B.Tech 3rd year in Computer Science Engineering "
                    "(AI & ML). I am interested in Artificial Intelligence "
                    "and Machine Learning and enjoy exploring new "
                    "technologies. I like developing practical projects "
                    "that improve my programming and problem-solving "
                    "skills. I am always interested in learning new "
                    "concepts and applying them to real-world problems.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.5,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;

  const Project(this.title, this.description);
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<Project> projects = [
    Project(
      'House Price Prediction',
      'A machine learning system that predicts house prices '
      'using features such as location, area, and number of rooms.',
    ),
    Project(
      'Disease Prediction System',
      'An ML-based application that predicts possible diseases '
      'from given symptoms using classification techniques.',
    ),
    Project(
      'Movie Recommendation System',
      'A recommendation system that suggests movies based on '
      'user preferences and previously watched movies.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B4FC4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project.description,
                          style: const TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ),
        ],
      ),
    );
  }
}
