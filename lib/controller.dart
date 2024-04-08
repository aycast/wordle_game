import 'package:flutter/material.dart';
import 'package:wodlegame/constants/answer_stages.dart';
import 'package:wodlegame/models/tile_model.dart';

class Controller extends ChangeNotifier{


  String correctWord ="";
  int currentTile =0;
  int currentRow = 0;
  List<TileModel> tilesEntered = [];

  setcorrectWord({required String word}) =>correctWord = word;

  setKeyTapped({required String value}){

    if(value=='ENTER'){
      if(currentTile==5 * (currentRow + 1)){
        checkWord();
      }

    }else if(value=='BACK'){
      if(currentTile > 5* (currentRow + 1)-5)
      currentTile--;
      tilesEntered.removeLast();

    }else{
      if(currentTile < 5 * (currentRow + 1)){
        tilesEntered.add(TileModel(letter: value, answerStage: AnswerStage.notAnswered));
      currentTile++;
      }
    }
    notifyListeners();
  }
  checkWord(){
    List<String> guessed = [], remainingCorrect = [];
    String guessedWord ="";
   
    for(int i = currentRow*5; i < (currentRow*5)+ 5;i++){
      guessed.add(tilesEntered[i].letter);
    }

    guessedWord = guessed.join();
    remainingCorrect =correctWord.characters.toList();


    if(guessedWord == correctWord){
      print('Tebriklerr Doğru Bildinn!!!!');
    }else{
      for(int i=0; i < 5; i++){
        if(guessedWord[i] == correctWord[i]){
          remainingCorrect.remove(guessedWord[i]);
          print('İçeriyor ve Yerinde ${guessedWord[i]}');
        }
      }

      for(int i=0; i< remainingCorrect.length; i++){
        for(int j=0 ; j < 5; j++){
          if(remainingCorrect[i]== tilesEntered[j + (currentRow *5)].letter){
            print('İçeriyor ${remainingCorrect[i]}');
          }
        }
    }
    currentRow++;
  }
  }
}