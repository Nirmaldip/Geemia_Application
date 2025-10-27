// class Category {
//   final int id;
//   final String name;
//
//   Category({required this.id, required this.name});
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json["id"],
//       name: json["name"],
//     );
//   }
// }

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
