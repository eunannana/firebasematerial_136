import 'package:firebase_core/firebase_core.dart';
// import 'package:firebasematerial/view/add_contact.dart';
import 'package:firebasematerial/view/contact.dart';
import 'package:firebasematerial/view/register.dart';
import 'package:flutter/material.dart';
import 'package:firebasematerial/view/login.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
