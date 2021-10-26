class RestResponse<T> {
  late T responseData;
  late String message;
  late int status;

  RestResponse({
    required this.responseData,
    required this.message,
    required this.status,
  });

  RestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? 500;
    message = json['message'] ?? '500';
    responseData = json['data'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.responseData != null) {
      data['data'] = this.responseData;
    }
    return data;
  }
}
