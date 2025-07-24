// 직렬화 : 객체를 JSON 형태의 문자열로 변환할 때
//        객체 -> Map -> String
//        jsonEncode
//        객체에 toJson 메서드 구현
// 역직렬화 : JSON 형태의 문자열을 객체로 변환할 때
//         String -> Map -> 객체
//         String -> Map : jsonDecode 함수
//         Map -> 객체 : 객체에 fromJson named 생성자를 구현해서 사용!

import 'dart:convert';

void main() {
  String easyJson = """
{
	"name": "오상구",
	"age": 7,
	"isMale" : true
}
""";

// String -> Map 형태로 바꾼다.
  Map<String, dynamic> easyMap = jsonDecode(easyJson);

// Map -> class 객체로 바꾼다.
  Pet pet = Pet.fromJson(easyMap);
  print(pet.toJson());
}

// 클래스 정의 Pet
class Pet {
  String name;
  int age;
  bool isMale;

  Pet({
    required this.name,
    required this.age,
    required this.isMale,
  });

// fromJson named 생성자 만들기
  Pet.fromJson(Map<String, dynamic> map)
      : this(name: map['name'], age: map['age'], isMale: map['isMale']);

// Map<String, dynamic> toJson 만들기
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isMale': isMale,
    };
  }
}
