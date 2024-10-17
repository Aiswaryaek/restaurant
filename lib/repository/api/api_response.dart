class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;
  int? statusCode;

  APIResponse({required this.data,required this.error,required this.errorMessage,this.statusCode});
}