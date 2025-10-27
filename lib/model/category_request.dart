class CategoryRequest {
  final String name;

  CategoryRequest({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}

class CategoryCreateResponse {
  final String status;
  final CategoryData data;

  CategoryCreateResponse({required this.status, required this.data});

  factory CategoryCreateResponse.fromJson(Map<String, dynamic> json) => CategoryCreateResponse(
    status: json['status'],
    data: CategoryData.fromJson(json['data']),
  );
}

class CategoryData {
  final String name;
  final String createdAt;

  CategoryData({required this.name, required this.createdAt});

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    name: json['name'],
    createdAt: json['createdAt'],
  );
}
