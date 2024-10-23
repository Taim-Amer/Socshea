import 'package:socshea/utils/exceptions/failures.dart';

class TPlatformException extends Failure {
  TPlatformException(String code)
      : super(code, _getMessage(code));

  static String _getMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'The application does not have the required permissions to perform this operation.';
      case 'not-available':
        return 'The requested feature or service is not available on this platform.';
      case 'not-found':
        return 'The requested resource was not found.';
      case 'no-internet':
        return 'No internet connection is available.';
      case 'operation-failed':
        return 'The operation could not be completed due to an unspecified platform error.';
      case 'invalid-format':
        return 'The data or file format is invalid or unrecognized.';
      case 'battery-low':
        return 'Operation cannot be completed because the device battery is too low.';
      case 'timeout':
        return 'The operation timed out. Please try again.';
      case 'user-cancelled':
        return 'The operation was cancelled by the user.';
      case 'feature-incompatible':
        return 'This feature is not compatible with the current device or platform version.';
      default:
        return 'An unknown platform exception occurred.';
    }
  }
}
