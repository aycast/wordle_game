
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wodlegame/controller.dart';

import '../data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({required this.max,required this.min,
    Key? key,
  }):super(key:key);

  final int min,max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keysMap.entries.map((e) {
        index++;
        if(index >= min && index <= max){
          return Padding(
            padding: EdgeInsets.all(size.width * 0.006),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color:Color.fromARGB(255, 188, 32, 143),
                width: e.key == 'ENTER' || e.key == 'BACK' ?
                size.width * 0.13:
                size.width * 0.085,
                height: size.height * 0.090,
                child: Material(
                  child:InkWell(
                      onTap: (){
                        Provider.of<Controller>(context, listen:false).setKeyTapped(value: e.key);
                      },
                      child:Center(child: Text(e.key))),
                  )),
            ),
          );
        }else {
          return const SizedBox();
        }
        }).toList(),
    );
  }
}