import 'dart:math';
import 'board_model.dart';
import 'formulas.dart';
import 'patterns.dart';

class Bot {
  final Map<int, BoardModel> boardMap;
  final ID player;
  Bot({
    required this.boardMap,
    required this.player,
  });

  ID _bot() {
    return player == ID.X ? ID.O : ID.X;
  }

  // winning spot

  // pattern lookup
  int _foundPattern() {
    Patterns patterns =
        Patterns(boardMap: boardMap, player: player, bot: _bot());
    return patterns.found();
  }

  // random spot
  int randomSpot() {
    Random random = Random();
    int spot = -1;
    if (!boardMap[4]!.taken) {
      return 4;
    } else if (!boardMap[0]!.taken ||
        !boardMap[2]!.taken ||
        !boardMap[6]!.taken ||
        !boardMap[8]!.taken) {
      List<int> list = [0, 2, 6, 8];
      list.shuffle();
      for (int corner in list) {
        if (!boardMap[corner]!.taken) {
          return corner;
        }
      }
    } else {
      for (int i = 0; i < boardMap.length; i++) {
        spot = random.nextInt(9);
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return spot;
  }

  // play
  int play() {
    Formulas formulas = Formulas(map: boardMap);
    final Map<String, int> decisionMap = {
      'win': -1,
      'block': -1,
      'pattern': -1
    };

    for (int i = 0; i < boardMap.length; i++) {
      // . . . WIN
      // row
      int row = formulas.row(i, _bot());

      if (row > -1) {
        decisionMap.update('win', (value) => row);
        // return row;
      }
      // col
      int col = formulas.col(i, _bot());

      if (col > -1) {
        decisionMap.update('win', (value) => col);
        // return col;
      }
      // diagonal
      int dia = formulas.dia(i, _bot());

      if (dia > -1) {
        decisionMap.update('win', (value) => dia);
        // return dia;
      }

      // . . . BLOCK
      // row
      int rowB = formulas.row(i, player);
      if (rowB > -1) {
        decisionMap.update('block', (value) => rowB);
        // return rowB;
      }
      // col
      int colB = formulas.col(i, player);
      if (colB > -1) {
        decisionMap.update('block', (value) => colB);
        // return colB;
      }
      // dia
      int diaB = formulas.dia(i, player);
      if (diaB > -1) {
        decisionMap.update('block', (value) => diaB);
        // return diaB;
      }
    }
    // . . . PATTERN
    int fondPattern = _foundPattern();
    if (_foundPattern() > -1) {
      decisionMap.update('pattern', (value) => fondPattern);
      // return fondPattern;
    }
    if (decisionMap['win']! > -1) {
      return decisionMap['win']!;
    } else if (decisionMap['block']! > -1) {
      return decisionMap['block']!;
    } else if (decisionMap['pattern']! > -1) {
      return decisionMap['pattern']!;
    } else {
      return randomSpot();
    }
  }
}

class Decision {
  // win
  // block
  // pattern
}
