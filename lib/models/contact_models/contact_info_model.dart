class ContactInfo {
  final int id;
  final String email;
  final String phone;
  final String address;

  ContactInfo({
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
  });

  ContactInfo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        phone = map['phone'],
        address = map['address'];
}
