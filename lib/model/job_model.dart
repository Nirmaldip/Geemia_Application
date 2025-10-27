class Job {
  final int categoryId;
  final String title;
  final String description;
  final String location;
  final String company;
  final String type;
  final int salary;

  Job({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.location,
    required this.company,
    required this.type,
    required this.salary,
  });
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      // The keys in the Map (like 'categoryId') must match the keys in your JSON
      // We use 'as int' and 'as String' to cast the dynamic values safely
      // and the null-aware operator '?? 0' or '?? '' ' for safety
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      company: json['company'] as String,
      type: json['type'] as String,
      salary: json['salary'] as int,
    );
  }
        Map<String, dynamic> toJson() {
    return {
      "category_id": categoryId,
      "title": title,
      "description": description,
      "location": location,
      "company": company,
      "type": type,
      "salary": salary,
    };
  }

  @override
  String toString() {
    return 'Job{categoryId: $categoryId, title: $title, description: $description, location: $location, company: $company, type: $type, salary: $salary}';
  }
}
