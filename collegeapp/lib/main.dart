import 'package:collegeapp/pages/admin/add_company_page.dart';
import 'package:collegeapp/pages/admin/login.dart';
import 'package:collegeapp/pages/admin/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:collegeapp/utils/routes.dart';
import 'package:collegeapp/pages/user/login.dart';
import 'package:collegeapp/pages/user/register.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: Login(),
      routes:{
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.registerRoute: (context) => Register(),
      }
    );
  }
}