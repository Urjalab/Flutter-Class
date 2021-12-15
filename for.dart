void main() {
  List<String> names = ['Ram', 'Shyam', 'Hari', 'Shiva'];

  for (String name in names) {
    print(name);
  }
  for (int i = 0; i < names.length; i++) {
    print('$i ${names[i]}');
  }
}
