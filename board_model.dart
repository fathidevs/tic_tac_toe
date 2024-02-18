class BoardModel {

  final ID? player;
  final bool taken;
  
  BoardModel({
    this.player,
    required this.taken,
  });
}

enum ID { X, O }

