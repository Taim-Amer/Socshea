import 'package:socshea/utils/exceptions/failures.dart';

class TFireBaseException extends Failure {
  TFireBaseException(String code) : super(code, _getMessage(code));

  static String _getMessage(String code) {
    switch (code) {
      case 'cancelled':
        return 'The operation was cancelled (typically by the caller).';
      case 'unknown':
        return 'Unknown error or an error from a different error domain.';
      case 'invalid-argument':
        return 'Client specified an invalid argument.';
      case 'deadline-exceeded':
        return 'Deadline expired before the operation could complete.';
      case 'not-found':
        return 'Some requested document was not found.';
      case 'already-exists':
        return 'Some document that we attempted to create already exists.';
      case 'permission-denied':
        return 'The caller does not have permission to execute the specified operation.';
      case 'resource-exhausted':
        return 'Some resource has been exhausted.';
      case 'failed-precondition':
        return 'Operation was rejected because the system is not in a state required for the operation\'s execution.';
      case 'aborted':
        return 'The operation was aborted.';
      case 'out-of-range':
        return 'Operation was attempted past the valid range.';
      case 'unimplemented':
        return 'Operation is not implemented or not supported/enabled in this service.';
      case 'internal':
        return 'Internal errors. This means that some invariants expected by the underlying system have been broken.';
      case 'unavailable':
        return 'The service is currently unavailable.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption.';
      case 'unauthenticated':
        return 'The request does not have valid authentication credentials.';
      default:
        return 'An undefined Error happened.';
    }
  }
}
