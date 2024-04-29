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
