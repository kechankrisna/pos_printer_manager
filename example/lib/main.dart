import 'package:flutter/material.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';
import 'package:pos_printer_manager_example/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ensure printer profile is loaded
  await CapabilityProfile.ensureProfileLoaded();
  print("ensured");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
