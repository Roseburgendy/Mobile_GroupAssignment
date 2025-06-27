import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:assignment1/homepage.dart';

void main() {
  runApp(const MyApp());
}

=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'MainNavigation.dart';
import 'package:sqflite/sqflite.dart';
import 'dbzzq/openLocalDatabase.dart'; 
import 'services/database_service.dart';

late Database db; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  db = await openLocalDatabase();


  
  //test
  final dbService = DatabaseService(db);
  final userId = await dbService.createZzqUser();
  if (userId != null) {
  await dbService.insertSampleHealthDataForZzq(userId);
}

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

>>>>>>> Stashed changes
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
