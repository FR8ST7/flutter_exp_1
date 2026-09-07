import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile - Experiment 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  int _selectedNavIndex = 0;
  String _activeView = 'Home';

  // Course list for ListView (Step 9)
  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Flutter',
      'subtitle': 'Mobile Application Development',
      'icon': Icons.book,
      'color': Colors.blue,
      'code': '24CS2016',
    },
    {
      'title': 'Cloud Computing',
      'subtitle': 'Distributed Systems & AWS',
      'icon': Icons.cloud,
      'color': Colors.cyan,
      'code': '24CS2018',
    },
    {
      'title': 'Programming',
      'subtitle': 'Data Structures & Algorithms',
      'icon': Icons.code,
      'color': Colors.purple,
      'code': '24CS2010',
    },
    {
      'title': 'Web Technologies',
      'subtitle': 'HTML, CSS & JavaScript',
      'icon': Icons.web,
      'color': Colors.orange,
      'code': '24CS2014',
    },
    {
      'title': 'Database Management',
      'subtitle': 'SQL & Relational Databases',
      'icon': Icons.storage,
      'color': Colors.teal,
      'code': '24CS2012',
    },
  ];

  void _onIconTapped(int index, String name) {
    setState(() {
      _selectedNavIndex = index;
      _activeView = name;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Switched to $name tab'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showCourseDetails(Map<String, dynamic> course) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(course['icon'] as IconData, color: course['color'] as Color),
            const SizedBox(width: 10),
            Expanded(child: Text(course['title'] as String)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course Code: ${course['code']}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Subject: ${course['subtitle']}'),
            const SizedBox(height: 8),
            const Text('Status: Enrolled & Active', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Experiment Info',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Experiment 1',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.flutter_dash, size: 40, color: Colors.blue),
                children: const [
                  Text('Aim: Working with Widgets and Layouts'),
                  Text('Widgets used: Container, Row, Column, Expanded, Card, ListView'),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Step 6 & Step 5: Container & Column layout for Profile Header
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 44,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Student Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Raj',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Computer Science and Engineering',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white90,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Flutter Laboratory',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Step 7: Row widget with spaceEvenly containing icons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavIconButton(
                      icon: Icons.home,
                      label: 'Home',
                      index: 0,
                    ),
                    _buildNavIconButton(
                      icon: Icons.person,
                      label: 'Profile',
                      index: 1,
                    ),
                    _buildNavIconButton(
                      icon: Icons.settings,
                      label: 'Settings',
                      index: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Step 8: Featured Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.book,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: const Text(
                  'Flutter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Mobile Application Development'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showCourseDetails(_courses[0]),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enrolled Courses (ListView)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          // Step 9: Multiple items using ListView inside Expanded layout widget
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (course['color'] as Color).withOpacity(0.15),
                      child: Icon(
                        course['icon'] as IconData,
                        color: course['color'] as Color,
                      ),
                    ),
                    title: Text(
                      course['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(course['subtitle'] as String),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        course['code'] as String,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    onTap: () => _showCourseDetails(course),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIconButton({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _selectedNavIndex == index;
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Colors.grey.shade600;

    return InkWell(
      onTap: () => _onIconTapped(index, label),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
