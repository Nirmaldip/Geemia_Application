class ResponseFormat{
  String? status;
  String? reason;
  int? value;
  String? parameter;

  ResponseFormat();

  factory ResponseFormat.fromJson(Map<String, dynamic> json){
    String status='';
    if(json['status'].runtimeType == int){
      status = '${json['status']}';
    }else {status = '${json['status']}';}
    return ResponseFormat()
      ..status = status
      ..reason = json['reason'] as String?
      ..value = json['value'] as int?
      ..parameter = json['parameter'] as String?;
  }

  Map<String, dynamic> _toJson(ResponseFormat instance) =>
      <String, dynamic>{
        'status': instance.status,
        'reason': instance.reason,
        'value': instance.value,
        'parameter': instance.parameter,
      };

  @override
  String toString() {
    return 'ResponseFormat{status: $status, failedReason: $reason, failedValue: $value, parameter: $parameter}';
  }
}