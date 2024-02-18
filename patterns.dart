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
  //   .   . o
  int _a() {
    if (boardMap[0]!.player == player &&
        boardMap[4]!.player == player &&
        boardMap[8]!.player == bot) {
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
  // o .   .
  int _b() {
    if (boardMap[2]!.player == player &&
        boardMap[4]!.player == player &&
        boardMap[6]!.player == bot) {
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

  // o .   .
  //   . x .
  //   .   . x
  int _c() {
    if (boardMap[4]!.player == player &&
        boardMap[8]!.player == player &&
        boardMap[0]!.player == bot) {
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

  //   .   . o
  //   . x .
  // x .   .
  int _d() {
    if (boardMap[4]!.player == player &&
        boardMap[6]!.player == player &&
        boardMap[2]!.player == bot) {
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
    if (boardMap[0]!.player == player &&
        boardMap[8]!.player == player &&
        boardMap[4]!.player == bot) {
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
    if (boardMap[2]!.player == player &&
        boardMap[6]!.player == player &&
        boardMap[4]!.player == bot) {
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
    if (boardMap[1]!.player == player && boardMap[8]!.player == player) {
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
    if (boardMap[1]!.player == player && boardMap[6]!.player == player) {
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
    if (boardMap[0]!.player == player && boardMap[7]!.player == player) {
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
    if (boardMap[2]!.player == player && boardMap[7]!.player == player) {
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
    if (boardMap[1]!.player == player && boardMap[3]!.player == player) {
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
  //   .   .
  int _l() {
    if (boardMap[1]!.player == player && boardMap[5]!.player == player) {
      List list = [0, 1, 8];
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
    if (boardMap[3]!.player == player && boardMap[7]!.player == player) {
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
    if (boardMap[5]!.player == player && boardMap[7]!.player == player) {
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

  int found() {
    if (_a() > -1) {
      return _a();
    }
    if (_b() > -1) {
      return _b();
    }
    if (_c() > -1) {
      return _c();
    }
    if (_d() > -1) {
      return _d();
    }
    if (_e() > -1) {
      return _e();
    }
    if (_f() > -1) {
      return _f();
    }
    if (_g() > -1) {
      return _g();
    }
    if (_h() > -1) {
      return _h();
    }
    if (_i() > -1) {
      return _i();
    }
    if (_j() > -1) {
      return _j();
    }
    if (_k() > -1) {
      return _k();
    }
    if (_l() > -1) {
      return _l();
    }
    if (_m() > -1) {
      return _m();
    }
    if (_n() > -1) {
      return _n();
    }
    return -1;
  }
}
