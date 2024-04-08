import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wodlegame/controller.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (_) => Controller())
    ],
    
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wodle Pro Plus',
      theme: ThemeData(
        
      ),
      home: HomePage(),
    );
  }
}

