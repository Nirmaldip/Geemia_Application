class JobPostRequest {
  final int categoryId;
  final String title;
  final String description;

  JobPostRequest({
    required this.categoryId,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'category_id': categoryId,
    'title': title,
    'description': description,
  };
}

class JobPostResponse {
  final bool success;
  final String message;

  JobPostResponse({required this.success, required this.message});

  factory JobPostResponse.fromJson(Map<String, dynamic> json) => JobPostResponse(
    success: json['success'],
    message: json['message'],
  );
}
