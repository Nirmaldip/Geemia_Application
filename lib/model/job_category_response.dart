class JobCategoryResponse {
  final bool success;
  final List<JobCategory> data;

  JobCategoryResponse({required this.success, required this.data});

  factory JobCategoryResponse.fromJson(Map<String, dynamic> json) => JobCategoryResponse(
    success: json['success'],
    data: List<JobCategory>.from(json['data'].map((x) => JobCategory.fromJson(x))),
  );
}

class JobCategory {
  final int id;
  final String name;

  JobCategory({required this.id, required this.name});

  factory JobCategory.fromJson(Map<String, dynamic> json) => JobCategory(
    id: json['id'],
    name: json['name'],
  );
}
