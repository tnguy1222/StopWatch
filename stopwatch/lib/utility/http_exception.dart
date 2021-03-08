/*
* Stop Watch version 3.0
* HttpException service version 3.0
* Jim Nguyen
* March 7, 2021
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
