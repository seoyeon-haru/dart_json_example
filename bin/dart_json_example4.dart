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
  String idolJson = """
{
  "name" : "차은우",
  "age" : 29,
  "isFemale" : false,
  "isIdol" : true
}
""";

// String -> Map
  Map<String, dynamic> idolMap = jsonDecode(idolJson);

// Map을 객체로
  Idol idol = Idol.fromJson(idolMap);
  print(idol.toJson());
}

// 클래스 정의 Idol
class Idol {
  String name;
  int age;
  bool isFemale;
  bool isIdol;

  Idol({
    required this.name,
    required this.age,
    required this.isFemale,
    required this.isIdol,
  });

// fromJson named 생성자 만들기
  Idol.fromJson(Map<String, dynamic> map)
      : this(
            name: map['name'],
            age: map['age'],
            isFemale: map['isFemale'],
            isIdol: map['isIdol']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'isFemale': isFemale, 'isIdol': isIdol};
  }
}
