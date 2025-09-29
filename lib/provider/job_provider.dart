import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geemia_app/model/job_model.dart';
import 'package:geemia_app/retrofit/api_client.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../model/job_model.dart';


class JobProvider with ChangeNotifier {
  final ApiClient apiClient;


  JobProvider(this.apiClient);


  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> postJob(Job job) async {
    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {
      await apiClient.postJob(job);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }}