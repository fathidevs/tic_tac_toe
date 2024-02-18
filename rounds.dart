import 'board.dart';
import 'board_model.dart';
import 'bot.dart';

class Rounds{
  final Board board;
  final ID player1;
  final ID player2;
  final bool withBot;
  
  Rounds({
  required this.board,
    required this.player1,
    required this.player2,
    this.withBot = true,
  });
  
  play(int index){
    bool played = board.set(
    index, player1);
    if(played && withBot){
      botPlays();
    }
  }
  botPlays(){
    Bot bot = Bot(
      boardMap: board.getAll(),
      player: player1,
      );
    int index = bot.play();
    board.set(index, player2);
  }
  Iterable<MapEntry<int,BoardModel>> review(){
    return board.getAll().entries;
  }
}