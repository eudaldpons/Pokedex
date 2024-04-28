import 'dart:js_interop';

class Pokemon {
  String id;
  String name;
  String imageUrl;
  String height;
  String weight;
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
      : id = json['id'],
        name = json['name'],
        imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png",
        height = json['height'],
        weight = json['weight'],
        types = json['types'].cast<String>();
}
