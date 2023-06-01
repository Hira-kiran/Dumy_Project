import 'package:dumy_project/data/responses/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({this.message, this.status, this.data});

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.completed;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "Status: $status Data: $data, Message:$message";
  }
}
