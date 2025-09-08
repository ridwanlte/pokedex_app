import 'package:pokedex_app/features/home/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  List<String>? evolutions;
  List<String>? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? malePercentage;
  String? femalePercentage;
  int? genderless;
  String? cycles;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;

  PokemonModel({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.evolvedfrom,
    this.reason,
    this.baseExp,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json['name'] as String?,
        id: json['id'] as String?,
        imageurl: json['imageurl'] as String?,
        xdescription: json['xdescription'] as String?,
        ydescription: json['ydescription'] as String?,
        height: json['height'] as String?,
        category: json['category'] as String?,
        weight: json['weight'] as String?,
        typeofpokemon: (json['typeofpokemon'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList(),
    weaknesses: (json['weaknesses'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList(),
    evolutions: (json['evolutions'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList(),
    abilities: (json['abilities'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toList(),
        // typeofpokemon: json['typeofpokemon'] as List<String>?,
        // weaknesses: json['weaknesses'] as List<String>?,
        // evolutions: json['evolutions'] as List<String>?,
        // abilities: json['abilities'] as List<String>?,
        hp: json['hp'] as int?,
        attack: json['attack'] as int?,
        defense: json['defense'] as int?,
        specialAttack: json['special_attack'] as int?,
        specialDefense: json['special_defense'] as int?,
        speed: json['speed'] as int?,
        total: json['total'] as int?,
        malePercentage: json['male_percentage'] as String?,
        femalePercentage: json['female_percentage'] as String?,
        genderless: json['genderless'] as int?,
        cycles: json['cycles'] as String?,
        eggGroups: json['egg_groups'] as String?,
        evolvedfrom: json['evolvedfrom'] as String?,
        reason: json['reason'] as String?,
        baseExp: json['base_exp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'imageurl': imageurl,
        'xdescription': xdescription,
        'ydescription': ydescription,
        'height': height,
        'category': category,
        'weight': weight,
        'typeofpokemon': typeofpokemon,
        'weaknesses': weaknesses,
        'evolutions': evolutions,
        'abilities': abilities,
        'hp': hp,
        'attack': attack,
        'defense': defense,
        'special_attack': specialAttack,
        'special_defense': specialDefense,
        'speed': speed,
        'total': total,
        'male_percentage': malePercentage,
        'female_percentage': femalePercentage,
        'genderless': genderless,
        'cycles': cycles,
        'egg_groups': eggGroups,
        'evolvedfrom': evolvedfrom,
        'reason': reason,
        'base_exp': baseExp,
      };
}
