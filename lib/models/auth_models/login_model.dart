class Login {
  final String email;
  final String password;

  Login({required this.email, required this.password});

  toMap() {
    return {
      "email": email,
      "password": password,
    };
  }

  Login.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];


}