class JobListResponse {
  final List<Job> jobs;

  JobListResponse({required this.jobs});

  factory JobListResponse.fromJson(Map<String, dynamic> json) => JobListResponse(
    jobs: List<Job>.from(json['data'].map((x) => Job.fromJson(x))),
  );
}

class Job {
  final int id;
  final String title;
  final String description;
  final String country;

  Job({required this.id, required this.title, required this.description, required this.country});

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    country: json['country'],
  );
}
