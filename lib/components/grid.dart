import 'package:flutter/material.dart';
import 'package:wodlegame/components/tile.dart';

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     physics: NeverScrollableScrollPhysics(),//ekran kaydırılmasın diye
     itemCount: 30,//kaç tane ekranda görünecegi yazmazsak sonsuz tane olur
     padding: EdgeInsets.fromLTRB(36, 20, 36, 20),//ekrandaki yeri
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       mainAxisSpacing: 4,//satır
       crossAxisSpacing: 4,//sutun
       crossAxisCount: 5,
     ), //layout
     itemBuilder: (context, index){
       return Container(
       decoration:BoxDecoration(
        border: Border.all()//kutuların kenarları
       ) ,
      child: Tile(index: index,),
       );
       
     }
     );
  }
}

