class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  User copyWith({String? firstName, String? lastName, String? email}) {
    return User(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}
