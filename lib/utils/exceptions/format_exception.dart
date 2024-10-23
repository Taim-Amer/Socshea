import 'package:socshea/utils/exceptions/failures.dart';

class TFormatException extends Failure {
  TFormatException(String message) : super('format_exception', message);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-date':
        return TFormatException('The date format is invalid.');
      case 'invalid-number':
        return TFormatException('The number format is incorrect.');
      case 'json-parsing':
        return TFormatException('JSON parsing error.');
      case 'uri-parsing':
        return TFormatException('URI parsing error.');
      case 'hex-color':
        return TFormatException('Invalid hex color format.');
      default:
        return TFormatException('Unknown format exception occurred.');
    }
  }
}
