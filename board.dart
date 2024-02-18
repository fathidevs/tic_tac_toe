import 'board_model.dart';

class Board {
  static int a = 3;
  
  Map<int, BoardModel> _map = Map.fromIterable(List.generate(9, (i) => i),
      key: (item) => item, value: (item) => BoardModel(taken: false));

  bool set(int index, ID id) {
    if (!_map[index]!.taken) {
      _map[index] = BoardModel(player: id, taken: true);
      return true;
    }
    return false;
  }

  BoardModel get(int index) {
    return _map[index]!;
  }

  Map<int, BoardModel> getAll() {

    return _map;
  }
}
