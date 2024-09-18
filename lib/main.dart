import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_kerjaku/navigator/navigator_page.dart';
import 'package:pos_kerjaku/pages/home_page.dart';
import 'package:pos_kerjaku/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigatorPage(id: 3),
      // home: LoginPage(),
    );
  }
}

// Halaman Search
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Order Page'),
    );
  }
}

// Halaman Profile
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Menu Page'),
    );
  }
}
