import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_key_state.dart';

class FormKeyCubit extends Cubit<FormKeyState> {

  static FormKeyCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  FormKeyCubit() : super(FormKeyInitial());

  void validateForm() {
    if (formKey.currentState!.validate()) {
      // Form is valid
      emit(FormKeyValid());
    } else {
      // Form is not valid
      emit(FormKeyInvalid());
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }
}
