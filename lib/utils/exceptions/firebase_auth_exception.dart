import 'package:socshea/utils/exceptions/failures.dart';

class TFireBaseAuthException extends Failure {
  TFireBaseAuthException(String code)
      : super(code, _getMessage(code));

  static String _getMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'user-not-found':
        return 'There is no user corresponding to the given email.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'too-many-requests':
        return 'Too many attempts to sign in as this user. Try again later.';
      case 'operation-not-allowed':
        return 'Email and Password accounts are not enabled. Enable them in the Firebase Console.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'weak-password':
        return 'The password provided is too weak. Please use a stronger password.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'provider-already-linked':
        return 'This provider is already linked to your account.';
      case 'no-such-provider':
        return 'User does not have this provider linked to their account.';
      case 'invalid-credential':
        return 'The credential provided is malformed or has expired.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'auth-domain-config-required':
        return 'The authentication configuration is not set up properly on the Firebase Console.';
      case 'invalid-action-code':
        return 'The action code in the link is invalid. This can happen if the code is malformed, expired, or has already been used.';
      case 'invalid-verification-code':
        return 'The verification code used to create the phone auth credential is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID used to create the phone auth credential is invalid.';
      default:
        return 'An undefined Error happened.';
    }
  }
}
