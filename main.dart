import 'board.dart';
import 'board_model.dart';
import 'rounds.dart';

main(){
  Board _board = Board();
  Rounds _round = Rounds(
  board: _board,
  player1:ID.X,
  player2:ID.O,
  withBot: false);
  
  
  _round.play(0);
  _round.play(8);
  
  for(MapEntry index in _round.review()){
    int key = index.key;
    BoardModel model = index.value;
    print('\t$key : ${model.player}');
  }
}
