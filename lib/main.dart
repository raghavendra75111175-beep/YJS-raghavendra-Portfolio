import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

/// Root widget: sets up MaterialApp with named routes for navigation.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4B4FC4),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4B4FC4)),
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
      // Named routes as required by the rubric.
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

// ---------------------------------------------------------------------------
// HOME PAGE
// ---------------------------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery used to make sizing responsive to screen width.
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth < 400 ? 50.0 : 60.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile image via CircleAvatar + NetworkImage.
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: const Color(0xFFE4D9FA),
                backgroundImage: const NetworkImage(
                  'https://github.com/gnan-k.png',
                ),
              ),
              const SizedBox(height: 24),

              // Name, styled with Text widget.
              const Text(
                'KONDAVEETI GNANA KUMAR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Color(0xFF4B4FC4),
                ),
              ),
              const SizedBox(height: 6),

              // Designation.
              const Text(
                'B.Tech 3rd Year · Computer Science-AIML',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),

              // Navigation buttons.
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: const Text('About Me'),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/projects');
                },
                child: const Text('Projects'),
              ),
              const SizedBox(height: 24),

              // Quick contact links, laid out with a Row.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined, size: 18),
                    label: const Text('gnanakumarkondaveeti7@gmail.com'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// ABOUT PAGE
// ---------------------------------------------------------------------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE7E8F7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: const [
                  Icon(Icons.person, size: 42, color: Color(0xFF4B4FC4)),
                  SizedBox(height: 20),
                  Text(
                    "Hello! I'm K. Gnana Kumar, currently pursuing my "
                    "B.Tech 3rd year in Computer Science Engineering "
                    "(AI & ML) at CR Rao AIMSCS. I enjoy learning about "
                    "Artificial Intelligence and Machine Learning and "
                    "exploring new technologies through hands-on "
                    "projects. I like building creative and practical "
                    "projects that help me improve my technical skills. "
                    "Apart from technology, I enjoy working out and "
                    "spending time on songwriting and music. I'm always "
                    "interested in learning new things, improving "
                    "myself, and turning my ideas into meaningful "
                    "projects.",
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
            const SizedBox(height: 28),
            ElevatedButton(
              // Navigator.pop() returns to the previous page (Home).
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// PROJECTS PAGE
// ---------------------------------------------------------------------------
class Project {
  final String title;
  final String description;
  const Project(this.title, this.description);
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<Project> projects = [
    Project(
      'AI-Powered Content Moderation System',
      'A Python-based intelligent tool for video content filtering '
          'and analysis.',
    ),
    Project(
      'Sentiment Analysis System',
      'An ML-based system that classifies text sentiment as '
          'positive, negative, or neutral.',
    ),
    Project(
      'Student Management System',
      'An application to manage student records, attendance, and '
          'academic details.',
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
          // Expanded + ListView.builder keeps this responsive for any
          // number of projects and any screen size.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                        const SizedBox(height: 6),
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
            padding: const EdgeInsets.only(bottom: 24, top: 4),
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
