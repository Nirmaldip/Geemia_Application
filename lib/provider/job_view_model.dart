import 'package:flutter/material.dart';
import 'package:geemia_app/model/job_detailed_response.dart';
import 'package:geemia_app/retrofit/api_client.dart';

class JobViewModel extends ChangeNotifier {
  final ApiClient apiClient;

  JobViewModel({required this.apiClient});

  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;

  List<JobCategory> _categories = [];
  List<JobCategory> get categories => _categories;

  JobDetailResponse? _selectedJob;
  JobDetailResponse? get selectedJob => _selectedJob;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  // Fetch job categories
  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiClient.getJobCategories();
      _categories = response.data;
    } catch (e) {
      _error = "Failed to load categories";
    }
    _isLoading = false;
    notifyListeners();
  }

  // Fetch job list
  Future<void> fetchJobs() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiClient.getJobs();
      _jobs = response.jobs;
    } catch (e) {
      _error = "Failed to load jobs";
    }
    _isLoading = false;
    notifyListeners();
  }

  // Fetch job detail
  Future<void> fetchJobDetail(int jobId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiClient.getJobDetail(jobId);
      _selectedJob = response;
    } catch (e) {
      _error = "Failed to load job detail";
    }
    _isLoading = false;
    notifyListeners();
  }

  // Create job post
  Future<bool> createJobPost(JobPostRequest request) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await apiClient.createJobPost(request);
      _error = null;
      return response.success;
    } catch (e) {
      _error = "Failed to create job post";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
