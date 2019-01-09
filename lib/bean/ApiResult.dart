
class Payload<T> {
  String resultcode;
  String reason;
  T result;
  int error_code;

  Payload({this.resultcode, this.reason, this.result, this.error_code});

  Payload.fromJson(Map<String, dynamic> json) {
    resultcode = json['resultcode'];
    reason = json['reason'];
    error_code = json['error_code'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultcode'] = this.resultcode;
    data['reason'] = this.reason;
    data['error_code'] = this.error_code;
    data['result'] = this.result;
    return data;
  }
}
