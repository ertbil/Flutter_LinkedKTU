class Product {
  final int id;
  final String name;
  final String description;

  Product(this.id, this.name, this.description);

  Product.fromMap(Map<String, dynamic> map):
    id = map['id'],
    name = map['name'],
    description = map['description'];
}
