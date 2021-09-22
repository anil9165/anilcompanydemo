class LogInResponce {
  String? token;
  String? error;

  LogInResponce({this.token, this.error});

  LogInResponce.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['error'] = this.error;
    return data;
  }
}
