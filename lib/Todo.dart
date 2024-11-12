import 'dart:convert';

/*
Todo 클래스가 정의되어 있습니다. 이 클래스는 ToDo 항목을 나타내며, ToDo 항목의 ID, 제목, 완료 여부를 저장합니다.

Todo 클래스는 다음과 같은 필드와 메서드를 가지고 있습니다.

id: ToDo 항목의 고유 ID를 나타내는 정수형 필드입니다. int? 형식으로 선언되어 있으므로 null 값을 가질 수도 있습니다.
title: ToDo 항목의 제목을 나타내는 문자열 필드입니다.
completed: ToDo 항목이 완료되었는지 여부를 나타내는 부울 필드입니다.
Todo() 생성자: id, title, completed 필드를 초기화하는 생성자입니다.
Todo.fromJson() 팩토리 생성자: JSON 문자열에서 Todo 객체를 만드는 메서드입니다. JSON 문자열을 파싱하여 id, title, completed 필드를 초기화합니다.
toJson() 메서드: Todo 객체를 JSON 형식으로 변환하는 메서드입니다. 반환값은 Map<String, dynamic> 형식이며, id, title, completed 필드를 가지고 있습니다. 이 메서드는 HTTP 요청에서 Todo 객체를 전송하기 위해 사용됩니다.

 */


class Products {
  final String name; 
  final String manufacturer;
  final String image;
  final int price;
  final String id;
  final String description;
  final bool selected;


  // 생성자
  Products({
    required this.name,
    required this.manufacturer,
    required this.image,
    required this.price,
    required this.id,
    required this.description,
    required this.selected
  });

  // JSON에서 Products 객체를 만드는 생성자
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      id: json['id'] as String,
      description: json['description'] as String,
      selected: json['selected'] as bool,
    );
  }

  // Products 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'manufacturer': manufacturer, 
      'image': image, 
      'price': price, 
      'id': id, 
      'description': description, 
      'selected': selected,
    };
  }
}
