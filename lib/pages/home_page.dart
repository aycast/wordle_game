import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wodlegame/data/keys_map.dart';

import '../components/grid.dart';
import '../components/keyboard_row.dart';
import '../constants/words.dart';
import '../controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String _word;

  @override
  void initState() {// words den rastgele kelime secen kod
    final r = Random().nextInt(words.length);
    _word =words[r];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen :  false).setcorrectWord(word: _word);
    });    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle KOU'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
     ),
     body: Column(
      children:[
        Expanded(
         flex: 7,
         child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
            child:const Grid(),
         )),
        
        Expanded(
        flex: 4,
         child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                   Colors.green,
                  Colors.blue,
                ],
              ),
            ),
         child: const Column(
          children: [
            KeyboardRow(min:1, max:10,),
            KeyboardRow(min:11, max:19,),
            KeyboardRow(min:20, max:29,),
          ],
         ),
         )),
      
      ],
     ),
    );
  }
}


