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
