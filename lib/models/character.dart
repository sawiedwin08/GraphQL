class Character {
  final String name;
  final String height;
  final String mass;
  final String gender;
  final String homeworld;

  Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.gender,
    required this.homeworld,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Desconocido',
      height: json['height'] ?? 'Desconocido',
      mass: json['mass'] ?? 'Desconocido',
      gender: json['gender'] ?? 'Desconocido',
      homeworld: json['homeworld']['name'] ?? 'Desconocido',
    );
  }

  get birthYear => null;

  get id => null;
}