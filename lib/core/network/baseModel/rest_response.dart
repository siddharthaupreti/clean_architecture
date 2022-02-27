import 'package:flutter/material.dart';

//for getting response from the server and decoding them

class RestResponse<T> {
  late List<dynamic> responseData;
  /* String message;
  int status;*/

  RestResponse({
    required this.responseData,
    /* @required this.message,
    @required this.status,*/
  });

  RestResponse.fromJson(List<dynamic> json) {
    print('rest response from json');
    /*status = json['status'] ?? 500;
    message = json['message'] ?? '500';*/
    responseData = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    /* data['status'] = this.status;
    data['message'] = this.message;*/
    if (this.responseData != null) {
      data['data'] = this.responseData;
    }
    return data;
  }
}
