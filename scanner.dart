<<<<<<< HEAD
import "board_model.dart";

class Scanner {
  final List<BoardModel> list;
  final id player;
  final id bot;
  Scanner({
    required this.list,
=======
import "dart:math";
import "board_model.dart";

class Scanner {
  final Map<int, BoardModel> boardMap;

  final ID player;
  final ID bot;
  Scanner({
    required this.boardMap,
>>>>>>> 1f9d93b (full restructure)
    required this.player,
    required this.bot,
  });

  int _size() {
<<<<<<< HEAD
    return list.length;
  }

  Map<String, int> scan() {
    Map<String, int> spots = {'win': -1, 'block': -1};
    // scanning row
=======
    return boardMap.length;
  }

  Map<String, dynamic> scan() {
    Map<String, dynamic> spots = {
      'win': -1,
      'block': -1,
      'won': null,
      'at': null,
      'ended': false,
    };

>>>>>>> 1f9d93b (full restructure)
    for (int i = 0; i < _size(); i++) {
      int rowBot = _row(i, bot);
      int rowPlayer = _row(i, player);
      if (rowBot > -1) {
        spots.update('win', (value) => rowBot);
<<<<<<< HEAD
      }
      if (rowPlayer > -1) {
        spots.update('block', (value) => rowPlayer);
=======
        spots.update('at', (value) => _getRow(i));
        spots.update('won', (value) => bot);
        spots.update('ended', (value) => true);
      } else if (rowBot == -1) {
        spots.update('won', (value) => bot);
        spots.update('at', (value) => _getRow(i));
        spots.update('ended', (value) => true);
      }
      if (rowPlayer > -1) {
        spots.update('block', (value) => rowPlayer);
      } else if (rowPlayer == -1) {
        spots.update('won', (value) => bot);
        spots.update('at', (value) => _getRow(i));
        spots.update('ended', (value) => true);
>>>>>>> 1f9d93b (full restructure)
      }
      int colBot = _col(i, bot);
      int colPlayer = _col(i, player);
      if (colBot > -1) {
        spots.update('win', (value) => colBot);
<<<<<<< HEAD
      }
      if (colPlayer > -1) {
        spots.update('block', (value) => colPlayer);
=======
        spots.update('at', (value) => _getCol(i));
        spots.update('won', (value) => bot);
        spots.update('ended', (value) => true);
      } else if (colBot == -1) {
        spots.update('won', (value) => bot);
        spots.update('at', (value) => _getCol(i));
        spots.update('ended', (value) => true);
      }
      if (colPlayer > -1) {
        spots.update('block', (value) => colPlayer);
      } else if (colPlayer == -1) {
        spots.update('won', (value) => bot);
        spots.update('at', (value) => _getCol(i));
        spots.update('ended', (value) => true);
>>>>>>> 1f9d93b (full restructure)
      }
      int diaBot = _dia(i, bot);
      int diaPlayer = _dia(i, player);
      if (diaBot > -1) {
        spots.update('win', (value) => diaBot);
<<<<<<< HEAD
      }
      if (diaPlayer > -1) {
        spots.update('block', (value) => diaPlayer);
      }
=======
        spots.update('at', (value) => 'd.$i');
        spots.update('won', (value) => bot);
        spots.update('ended', (value) => true);
      } else if (diaBot == -1) {
        spots.update('won', (value) => bot);
        spots.update('at', (value) => 'd.$i');
        spots.update('ended', (value) => true);
      }
      if (diaPlayer > -1) {
        spots.update('block', (value) => diaPlayer);
      } else if (diaPlayer == -1) {
        spots.update('won', (value) => player);
        spots.update('at', (value) => 'd.$i');
        spots.update('ended', (value) => true);
      }
    }
    print('spots: $spots');
    return spots;
  }

  int strategicSpot(Map<String, dynamic> scanResult) {
    // Map<String, dynamic> scn = scan();
    int gameDificulty = 3;
    switch (gameDificulty) {
      case 3:
        if (scanResult['win'] != null && scanResult['win']! > -1) {
          return scanResult['win']!;
        } else if (scanResult['block'] != null && scanResult['block']! > -1) {
          return scanResult['block']!;
        } else {
          return _randomSpots();
        }

      default:
        return _randomSpots();
>>>>>>> 1f9d93b (full restructure)
    }
    return spots;
  }

<<<<<<< HEAD
  int _row(int index, id playerId) {
    int current = index;
    int next = _rowFormula(index);
    int last = _rowFormula(next);

    if (list[current].player == playerId &&
        list[next].player == playerId &&
        !list[last].taken) {
      return last;
    }
    return -1;
  }

  int _col(int index, id playerId) {
    int current = index;
    int next = _colFormula(index);
    int last = _colFormula(next);

    if (list[current].player == playerId &&
        list[next].player == playerId &&
        !list[last].taken) {
      return last;
    }
    return -1;
  }

  int _dia(int index, id playerId) {
    if (index == 0) {
      if (list[0].player == playerId &&
          list[4].player == playerId &&
          !list[8].taken) {
        return 8;
      }
      if (list[4].player == playerId &&
          list[8].player == playerId &&
          !list[0].taken) {
        return 0;
      }
      if (list[0].player == playerId &&
          list[8].player == playerId &&
          !list[4].taken) {
        return 4;
      }
    } else if (index == 2) {
      if (list[2].player == playerId &&
          list[4].player == playerId &&
          !list[6].taken) {
        return 6;
      }
      if (list[4].player == playerId &&
          list[6].player == playerId &&
          !list[2].taken) {
        return 2;
      }
      if (list[6].player == playerId &&
          list[2].player == playerId &&
          !list[4].taken) {
        return 4;
      }
    }
    return -1;
  }

  int _rowFormula(int index) {
    return index % 3 == 2 ? index - 2 : index + 1;
  }

  int _colFormula(int index) {
    return (index + 3) % 9;
  }
=======
  int _randomSpots() {
    int cornerSpots = _cornerSpots();
    Random random = Random();
    int findSpot = -1;
    if (cornerSpots < 0) {
      do {
        findSpot = random.nextInt(9);
      } while (boardMap[findSpot]!.taken);
      return findSpot;
    } else {
      return cornerSpots;
    }
  }

  int _cornerSpots() {
    int spot = -1;
    List<int> spots = [0, 2, 6, 8];
    int ctr = 0;
    while (!boardMap[ctr]!.taken) {
      spot = spots[ctr];
      ctr++;
    }
    return spot;
  }

  int _row(int index, ID playerId) {
    int current = index;
    int next = _nextInRowFormula(index);
    int last = _nextInRowFormula(next);

    if (boardMap[current]!.player == playerId &&
        boardMap[next]!.player == playerId &&
        !boardMap[last]!.taken) {
      return last;
    } else if (boardMap[current]!.player == playerId &&
        boardMap[next]!.player == playerId &&
        boardMap[last]!.player == playerId) {
      return -1;
    }
    return -2;
  }

  int _col(int index, ID playerId) {
    int current = index;
    int next = _nextInColFormula(index);
    int last = _nextInColFormula(next);

    if (boardMap[current]!.player == playerId &&
        boardMap[next]!.player == playerId &&
        !boardMap[last]!.taken) {
      return last;
    } else if (boardMap[current]!.player == playerId &&
        boardMap[next]!.player == playerId &&
        boardMap[last]!.player == playerId) {
      return -1;
    }
    return -2;
  }

  int _dia(int index, ID playerId) {
    if (index == 0) {
      if (boardMap[0]!.player == playerId &&
          boardMap[4]!.player == playerId &&
          !boardMap[8]!.taken) {
        return 8;
      } else if (boardMap[0]!.player == playerId &&
          boardMap[4]!.player == playerId &&
          boardMap[8]!.player == playerId) {
        return -1;
      }
      if (boardMap[4]!.player == playerId &&
          boardMap[8]!.player == playerId &&
          !boardMap[0]!.taken) {
        return 0;
      } else if (boardMap[4]!.player == playerId &&
          boardMap[8]!.player == playerId &&
          boardMap[0]!.player == playerId) {
        return -1;
      }
      if (boardMap[0]!.player == playerId &&
          boardMap[8]!.player == playerId &&
          !boardMap[4]!.taken) {
        return 4;
      } else if (boardMap[0]!.player == playerId &&
          boardMap[8]!.player == playerId &&
          boardMap[4]!.player == playerId) {
        return -1;
      }
    } else if (index == 2) {
      if (boardMap[2]!.player == playerId &&
          boardMap[4]!.player == playerId &&
          !boardMap[6]!.taken) {
        return 6;
      } else if (boardMap[2]!.player == playerId &&
          boardMap[4]!.player == playerId &&
          boardMap[6]!.player == playerId) {
        return -1;
      }
      if (boardMap[4]!.player == playerId &&
          boardMap[6]!.player == playerId &&
          !boardMap[2]!.taken) {
        return 2;
      } else if (boardMap[4]!.player == playerId &&
          boardMap[6]!.player == playerId &&
          boardMap[2]!.player == playerId) {
        return -1;
      }
      if (boardMap[6]!.player == playerId &&
          boardMap[2]!.player == playerId &&
          !boardMap[4]!.taken) {
        return 4;
      } else if (boardMap[6]!.player == playerId &&
          boardMap[2]!.player == playerId &&
          boardMap[4]!.player == playerId) {
        return -1;
      }
    }
    return -2;
  }

  int _nextInRowFormula(int index) {
    return index % 3 == 2 ? index - 2 : index + 1;
  }

  int _nextInColFormula(int index) {
    return (index + 3) % 9;
  }

  String _getCol(index) {
    return 'c.${index % 3}';
  }

  String _getRow(index) {
    return 'r.${index ~/ 3}';
  }
>>>>>>> 1f9d93b (full restructure)
}
