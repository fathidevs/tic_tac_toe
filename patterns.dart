import 'board_model.dart';

class Patterns {
  final Map<int, BoardModel> boardMap;
  final ID player;
  final ID bot;
  Patterns({
    required this.boardMap,
    required this.player,
    required this.bot,
  });

  // x .   .
  //   . x .
  //   .   .
  int _a() {
    if (_search(0) && _search(4)) {
      List list = [2, 6];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   . x
  //   . x .
  //   .   .
  int _b() {
    if (_search(2) && _search(4)) {
      List list = [0, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   .
  //   . x .
  //   .   . x
  int _c() {
    if (_search(4) && _search(8)) {
      List list = [2, 6];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   .
  //   . x .
  // x .   .
  int _d() {
    if (_search(4) && _search(6)) {
      List list = [0, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  // x .   .
  //   . o .
  //   .   . x
  int _e() {
    if (_search(0) && _search(8)) {
      List list = [1, 5, 7, 3];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   . x
  //   . o .
  // x .   .
  int _f() {
    if (_search(2) && _search(6)) {
      List list = [1, 5, 7, 3];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  //   .   .
  //   .   . x
  int _g() {
    if (_search(1) && _search(8)) {
      List list = [2, 0, 5];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  //   .   .
  // x .   .
  int _h() {
    if (_search(1) && _search(6)) {
      List list = [0, 2, 3];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  // x .   .
  //   .   .
  //   . x .
  int _i() {
    if (_search(0) && _search(7)) {
      List list = [3, 6, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   . x
  //   .   .
  //   . x .
  int _j() {
    if (_search(2) && _search(7)) {
      List list = [5, 6, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  // x .   .
  //   .   .
  int _k() {
    if (_search(1) && _search(3)) {
      List list = [0, 2, 6];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  //   .   . x
  //   .   .
  int _l() {
    if (_search(1) && _search(5)) {
      List list = [0, 2, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   .
  // x .   .
  //   . x .
  int _m() {
    if (_search(3) && _search(7)) {
      List list = [0, 6, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   .
  //   .   . x
  //   . x .
  int _n() {
    if (_search(5) && _search(7)) {
      List list = [2, 6, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  // x .   .
  //   .   . x
  //   . x .
  int _o() {
    if (_search(0) && _search(5) && _search(7)) {
      List list = [1, 2, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   .   . x
  // x .   .
  //   . x .
  int _p() {
    if (_search(0) && _search(3) && _search(7)) {
      List list = [0, 1, 6];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  //   .   . x
  // x .   .
  int _q() {
    if (_search(1) && _search(5) && _search(6)) {
      List list = [0, 2, 8];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  //   . x .
  // x .   .
  //   .   . x
  // {1:x,3:x,8:x, false:1} ->
  int _r() {
    if (_search(1) && _search(3) && _search(8)) {
      List list = [0, 2, 6];
      list.shuffle();
      for (int spot in list) {
        if (!boardMap[spot]!.taken) {
          return spot;
        }
      }
    }
    return -1;
  }

  int found() {
    List<int> list = [
      _a(),
      _b(),
      _c(),
      _d(),
      _e(),
      _f(),
      _g(),
      _h(),
      _i(),
      _j(),
      _k(),
      _l(),
      _m(),
      _n(),
      _o(),
      _p(),
      _q(),
      _r(),
    ];
    return list.firstWhere((element) => element > -1, orElse: () => -1);
  }

  bool _search(int index) {
    return boardMap[index]!.player == player;
  }
}
