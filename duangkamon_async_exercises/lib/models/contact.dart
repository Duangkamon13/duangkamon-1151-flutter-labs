class Contact {
  final String name;
  final String number;
  final String email;

  Contact({required this.name, required this.number, required this.email});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      number: json['number'].toString(), 
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'email': email,
    };
  }
}
