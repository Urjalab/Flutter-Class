void main() {
  Map<dynamic, dynamic> data = {"name": "ram", "age": 23, "isMale": true};
  if (data['isMale']) {
    print('${data['name']} is male');
  } else {
    print('${data['name']} female');
  }
}
