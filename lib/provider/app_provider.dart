import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AppProvider with ChangeNotifier {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://your.api.url"));

  AppProvider() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          return handler.resolve(Response(
            requestOptions: e.requestOptions,
            data: [],
            statusCode: 200,
          ));
        }
        return handler.next(e);
      },
    ));
  }

  // ---------------- Hookup Cards ----------------
  List<Map<String, dynamic>> _cards = [];
  bool _loadingCards = false;

  List<Map<String, dynamic>> get cards => _cards;
  bool get loadingCards => _loadingCards;

  Future<void> fetchHookupCards() async {
    _loadingCards = true;
    notifyListeners();
    try {
      final response = await _dio.get("/hookup/cards");
      _cards = List<Map<String, dynamic>>.from(response.data['cards'] ?? []);
    } catch (e) {
      _cards = [];
    }
    _loadingCards = false;
    notifyListeners();
  }
// ---------------- Chats ----------------
  List<Map<String, dynamic>> _chats = [];
  bool _loadingChats = false;

  List<Map<String, dynamic>> get chats => _chats;
  bool get loadingChats => _loadingChats;

  Future<void> fetchChats() async {
    _loadingChats = true;
    notifyListeners();
    try {
      final response = await _dio.get("/chats");
      _chats = List<Map<String, dynamic>>.from(response.data['chats'] ?? []);
    } catch (e) {
      _chats = [];
    }
    _loadingChats = false;
    notifyListeners();
  }
  // ---------------- Likes ----------------
  List<Map<String, dynamic>> _likes = [];
  bool _loadingLikes = false;

  List<Map<String, dynamic>> get likes => _likes;
  bool get loadingLikes => _loadingLikes;

  Future<void> fetchLikes() async {
    _loadingLikes = true;
    notifyListeners();
    try {
      final response = await _dio.get("/likes");
      _likes = List<Map<String, dynamic>>.from(response.data['likes'] ?? []);
    } catch (e) {
      _likes = [];
    }
    _loadingLikes = false;
    notifyListeners();
  }

  // ---------------- Incoming Call ----------------
  Map<String, dynamic>? _incomingCall;
  Map<String, dynamic>? get incomingCall => _incomingCall;

  Future<void> fetchIncomingCall() async {
    try {
      final response = await _dio.get("/calls/incoming");
      _incomingCall = response.data;
    } catch (e) {
      _incomingCall = null;
    }
    notifyListeners();
  }

  // ---------------- Video Call ----------------
  Map<String, dynamic>? _videoCall;
  Map<String, dynamic>? get videoCall => _videoCall;

  Future<void> fetchVideoCall() async {
    try {
      final response = await _dio.get("/calls/video");
      _videoCall = response.data;
    } catch (e) {
      _videoCall = null;
    }
    notifyListeners();
  }
}
