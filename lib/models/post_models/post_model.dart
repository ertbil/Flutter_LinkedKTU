class Post {
  final int id;
  final String title;
  final String description;
  final String company;
  final String role;
  final List<String> technologies;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.role,
    required this.technologies,
  });

  Post.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        company = map['company'],
        role = map['role'],
        technologies = map['technologies'];

  toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'company': company,
      'role': role,
      'technologies': technologies,
    };
  }
}
