import 'package:flutter/cupertino.dart';

class CallType with ChangeNotifier {
  int? callTypeId;
  String? callTypeTitle;
  int? completedCount;
  int? remainingCount;
  int? dialedCount;

  CallType({
    this.callTypeId,
    this.callTypeTitle,
    this.completedCount,
    this.remainingCount,
    this.dialedCount,
  });

  factory CallType.fromJson(Map<String, dynamic> json) {
    return CallType(
      callTypeId: json['callTypeId'],
      callTypeTitle: json['callType'], // fix this line
      completedCount: json['completedCount'],
      remainingCount: json['pendingCount'], // map 'pendingCount' to 'remainingCount'
      dialedCount: json['dialedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'callTypeId': callTypeId,
      'callType': callTypeTitle,
      'completedCount': completedCount,
      'pendingCount': remainingCount,
      'dialedCount': dialedCount,
    };
  }

  @override
  String toString() {
    return 'CallType{callTypeId: $callTypeId, callTypeTitle: $callTypeTitle, completedCount: $completedCount, remainingCount: $remainingCount, dialedCount: $dialedCount}';
  }
}
