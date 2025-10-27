import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:geemia_app/retrofit/api_client.dart';

class IHookupProvider with ChangeNotifier {
  final ApiClient api;
  bool isLoading = false;
  List<dynamic> profiles = [];

  IHookupProvider(this.api);

  Future<void> fetchProfiles() async {
    isLoading = true;
    notifyListeners();
    try {
      profiles = await api.getProfiles();
    } on DioError catch (e) {
      debugPrint("Fetch profiles error: ${e.response?.data}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> likeProfile(int profileId) async {
    try {
      await api.likeProfile({"profile_id": profileId});
    } catch (e) {
      debugPrint("Like profile error: $e");
    }
  }

  Future<void> unlikeProfile(int profileId) async {
    try {
      await api.unlikeProfile({"profile_id": profileId});
    } catch (e) {
      debugPrint("Unlike profile error: $e");
    }
  }

  Future<void> initiateVideoCall(int userId) async {
    try {
      await api.initiateCall(userId, {"type": "video"});
    } catch (e) {
      debugPrint("Initiate call error: $e");
    }
  }

  Future<void> updateCallStatus(int callId, String status) async {
    try {
      await api.updateCallStatus(callId, {"status": status});
    } catch (e) {
      debugPrint("Update call status error: $e");
    }
  }
}
