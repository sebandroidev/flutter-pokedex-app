class Evolution {
  final String numEvolution;
  final String name;

  const Evolution({required this.numEvolution, required this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) =>
      Evolution(numEvolution: json['num'], name: json['name']);
}
