import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String imageUrl;

  @HiveField(3)
  String height;

  @HiveField(4)
  String weight;

  @HiveField(5)
  List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'].toString(),
        imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id'].toString()}.png",
        height = '',
        weight = json['weight'].toString(),
        types = json['types'].map<String>((type) {
          return type['type']['name'].toString();
        }).toList() {
    id = json['id'].toString();
    name = json['name'].toString();
    imageUrl =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id'].toString()}.png";
    height = json['height'].toString();
    weight = json['weight'].toString();
    types = json['types'].map<String>((type) {
      return type['type']['name'].toString();
    }).toList();
  }
}
