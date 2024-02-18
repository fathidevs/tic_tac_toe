import 'board_model.dart';

class Formulas {
  final Map<int, BoardModel> map;
  Formulas({required this.map});
  int _nextInRowFormula(int index) {
    return index % 3 == 2 ? index - 2 : index + 1;
  }

  int row(int index, ID playerId) {
    int current = index;
    int next = _nextInRowFormula(index);
    int last = _nextInRowFormula(next);

    if (map[current]!.player == playerId &&
        map[next]!.player == playerId &&
        !map[last]!.taken) {
      return last;
    }
    return -1;
  }

  int _nextInColFormula(int index) {
    return (index + 3) % 9;
  }

  int col(int index, ID playerId) {
    int current = index;
    int next = _nextInColFormula(index);
    int last = _nextInColFormula(next);

    if (map[current]!.player == playerId &&
        map[next]!.player == playerId &&
        !map[last]!.taken) {
      return last;
    }
    return -1;
  }

  int dia(int index, ID playerId) {
    if (index == 0) {
      if (map[0]!.player == playerId &&
          map[4]!.player == playerId &&
          !map[8]!.taken) {
        return 8;
      }
      if (map[4]!.player == playerId &&
          map[8]!.player == playerId &&
          !map[0]!.taken) {
        return 0;
      }
      if (map[0]!.player == playerId &&
          map[8]!.player == playerId &&
          !map[4]!.taken) {
        return 4;
      }
    } else if (index == 2) {
      if (map[2]!.player == playerId &&
          map[4]!.player == playerId &&
          !map[6]!.taken) {
        return 6;
      }
      if (map[4]!.player == playerId &&
          map[6]!.player == playerId &&
          !map[2]!.taken) {
        return 2;
      }
      if (map[6]!.player == playerId &&
          map[2]!.player == playerId &&
          !map[4]!.taken) {
        return 4;
      }
    }
    return -1;
  }
}
