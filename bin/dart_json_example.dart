import 'dart:convert';

// 직렬화 : 객체를 JSON 형태의 문자열로 변환할 때
//        객체 -> Map -> String
//.       jsonEncode
//        객체에 toJson 메서드 구현
// 역직렬화 : JSON 형태의 문자열을 객체로 변환할 때
//         String -> Map -> 객체
//         String -> Map : jsonDecode 함수
//         Map -> 객체 : 객체에 fromJson named 생성자를 구현해서 사용!

void main() {
  // jsonEncode : Map => String 역할!
  Map<String, dynamic> map = {
    "name": "차은우",
    "age": 29,
  };
  String jsonData = jsonEncode(map);
  print(jsonData);

  String jsonSampleData = """
{
  "name":"차은우",
  "age":29
}
""";
  var decodedData = jsonDecode(jsonSampleData);
  print(decodedData.runtimeType);
  print(decodedData);

  Human human = Human.fromJson(decodedData);
  human.toJson();
}

class Human {
  String name;
  int age;

  Human({
    required this.name,
    required this.age,
  });

  Human.fromJson(Map<String, dynamic> map)
      : this(
          name: map['name'],
          age: map['age'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
