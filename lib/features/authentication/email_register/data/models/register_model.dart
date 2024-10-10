class RegisterModel{
  String firstName;
  String lastName;
  String username;
  String phone;
  String email;
  String password;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phone': phone,
      'email': email,
      'password' : password,
    };
  }
}