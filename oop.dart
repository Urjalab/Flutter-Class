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

class Apple extends Fruit {}

void main() {
  Fruit apple = Fruit();
  apple.color;
}
