/*
* Stop Watch version 4.0
* HttpException service version 4.0
* Jim Nguyen
* April 4,2021
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
