/*
* Stop Watch version 2.0
* HttpException service version 2.0
* Jim Nguyen
* February 7, 2021
* HttpException class acts a error handler class
*/
class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
