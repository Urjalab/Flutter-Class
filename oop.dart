class Fruit {
  String? _color;

  String? get color {
    return _color;
  }

  Fruit();

  void season() {
    print('This is a seaon');
  }
}

class Apple extends Fruit {
  @override
  void season() {
    print('this is apple season');
    super.season();
  }
}

void main() {
  Apple apple = Apple();
  apple.season();
}
