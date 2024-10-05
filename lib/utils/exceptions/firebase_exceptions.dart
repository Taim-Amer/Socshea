class TFirebaseAuthExceptions implements Exception{
  final String code;

  TFirebaseAuthExceptions(this.code);

  String get message{
    switch (code) {
      case "email-is-already-in-use":
        return "The email address is already registered. Please usr different email.";
      case "invalid-email":
        return "The email address provided is invalid. please enter a valid email.";
      case "weak-password":
        return "The password is weak. Please choose a stronger password.";
      case "user-disabled":
        return "The user account has been disabled. Please contact support for assistance.";
      case "user-not-found":
        return "Invalid login details. User not found.";
      case "wrong-password":
        return "Incorrect password. Please check your password and try again.";
      case "invalid-verification-code":
        return "Invalid verification code. Please enter valid code.";
      case "invalid-verification-id":
        return "Invalid verification ID. Please request a new verification code.";
      case "quota-exceeded":
        return "Quota exceeded. Please try again later.";
      case "email-already-exist":
        return "The email address already exists. Please use different email.";
      case "provider-already-linked":
        return "The account is already liked with another provider.";
      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Please log in again.";
      case "credential-already-in-use":
        return "This credential is already associated with a different user account.";
      case "user-mismatch":
        return "The supplied credentials do not correspond to the previously signed in user.";
      default:
        return "Something went wrong. Please try again.";
    }
    return code;
  }
}