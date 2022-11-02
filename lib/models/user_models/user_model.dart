class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String description;
  final String image;
  final String accountType;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.description,
    required this.image,
    required this.accountType,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        password = map['password'],
        name = map['name'],
        description = map['description'],
        image = map['image'],
        accountType = map['accountType'];
}
