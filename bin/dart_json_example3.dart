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
  String hardJson = """
{
  "name" : "오상구",
  "age" : 7,
  "isMale" : true,
  "favorite_foods" : ["삼겹살", "연어", "고구마"],
  "contact" : {
    "mobile" : "010-0000-0000",
    "email" : null
  }
}
""";

// String -> Map 형태로 바꾼다.
  Map<String, dynamic> hardMap = jsonDecode(hardJson);

  // Map을 객체로 바꾼다.
  PetDetail petDetail = PetDetail.fromJson(hardMap);
  print(petDetail.toJson());
}

// 클래스 정의 PetDetail
class PetDetail {
  String name;
  int age;
  bool isMale;
  List<String> faboriteFoods;
  Contact contact;

  PetDetail({
    required this.name,
    required this.age,
    required this.isMale,
    required this.faboriteFoods,
    required this.contact,
  });

  // fromJson 네임드 생성자
  PetDetail.fromJson(Map<String, dynamic> map)
      : this(
            name: map['name'],
            age: map['age'],
            isMale: map['isMale'],
            faboriteFoods: List<String>.from(map['favorite_foods']),
            contact: Contact.fromJson(map['contact']));

  // toJson 메서드
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isMale': isMale,
      'favorite_foods': faboriteFoods,
      'contact': contact.toJson(),
    };
  }
}

class Contact {
  String mobile;
  String? email;

  Contact({
    required this.mobile,
    required this.email,
  });

  // Contact.fromJson 네임드 생성자 만들기
  Contact.fromJson(Map<String, dynamic> map)
      : this(
          mobile: map['mobile'],
          email: map['email'],
        );
  // toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'email': email,
    };
  }
}
