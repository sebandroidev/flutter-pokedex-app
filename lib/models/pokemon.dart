import 'package:pokedex_app/models/evolution.dart';

class Pokemon {
  final int id;
  final String numPokemon;
  final String name;
  final String image;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final double avgSpawn;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<Evolution> nextEvolution;

  const Pokemon({
    required this.id,
    required this.numPokemon,
    required this.name,
    required this.image,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawn,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        numPokemon: json['num'],
        name: json['name'],
        image: json['img'],
        type: json['type'].cast<String>(),
        height: json['height'],
        weight: json['weight'],
        candy: json['candy'],
        candyCount: (int.tryParse(json['candy_count'].toString()) == null)
            ? 0
            : int.tryParse(json['candy_count'].toString())!,
        egg: json['egg'],
        spawnChance: double.tryParse(json['spawn_chance'].toString())!,
        avgSpawn: (double.tryParse(json['avg_spawns'].toString()) == null)
            ? 0.0
            : double.tryParse(json['avg_spawns'].toString())!,
        spawnTime: json['spawn_time'],
        multipliers: (json['multipliers'] == null)
            ? []
            : json['multipliers'].cast<double>(),
        weaknesses: json['weaknesses'].cast<String>(),
        nextEvolution: (json['evolution'] == null)
            ? []
            : (json['next_evolution'])
                .map<Evolution>((evolution) => Evolution.fromJson(evolution))
                .toList(),
      );
}
