import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final int id;
  final int height;
  final int weight;
  final String imageUrl;
  final Color color;
  final List types;
  final List abilities;
  final List<Stat> stats;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.id,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final height = json['height'];
    final weight = json['weight'];
    final name = json['name'];
    final imageUrl = json['sprites']['front_default'];
    final color = _getColorFromType(json['types'][0]['type']['name']);
    final types = _getTypes(json['types']);
    final abilities = _getAbilities(json['abilities']);

    final List<dynamic> statsData = json['stats'];
    final List<Stat> stats =
        statsData.map((data) => Stat.fromJson(data)).toList();

    return Pokemon(
        name: name,
        imageUrl: imageUrl,
        color: color,
        types: types,
        id: id,
        height: height,
        weight: weight,
        abilities: abilities,
        stats: stats);
  }

  static List _getStats(List statList) {
    List stats = [];

    for (var i = 0; i < statList.length; i++) {
      stats.add(statList[i]['type']['name']);
    }

    return stats;
  }

  static List _getTypes(List typeList) {
    List allType = [];

    for (var i = 0; i < typeList.length; i++) {
      allType.add(typeList[i]['type']['name']);
    }

    return allType;
  }

  static List _getAbilities(List abilityList) {
    List abilities = [];

    for (var i = 0; i < abilityList.length; i++) {
      abilities.add(abilityList[i]['ability']['name']);
    }

    return abilities;
  }

  static Color _getColorFromType(String type) {
    switch (type) {
      case 'fire':
        return Colors.orange.shade300;
      case 'water':
        return Colors.blue.shade300;
      case 'grass':
        return Colors.green.shade300;
      case 'electric':
        return Colors.yellow.shade300;
      case 'rock':
        return Colors.brown.shade300;
      default:
        return Colors.grey.shade300;
    }
  }
}

class Stat {
  final String name;
  final int value;

  Stat({required this.name, required this.value});

  factory Stat.fromJson(Map<String, dynamic> json) {
    final name = json['stat']['name'];
    final value = json['base_stat'];
    return Stat(name: name, value: value);
  }
}


// import 'package:flutter/material.dart';

// class Pokemon {
//   List<Ability> abilities;
//   int baseExperience;
//   List<Species> forms;
//   List<GameIndex> gameIndices;
//   int height;
//   List<dynamic> heldItems;
//   int id;
//   bool isDefault;
//   String locationAreaEncounters;
//   List<Move> moves;
//   String name;
//   int order;
//   List<dynamic> pastAbilities;
//   List<dynamic> pastTypes;
//   Species species;
//   Sprites sprites;
//   List<Stat> stats;
//   List<Type> types;
//   int weight;
//   final String imageUrl;
//   final Color color;

//   Pokemon({
//     required this.abilities,
//     required this.baseExperience,
//     required this.forms,
//     required this.gameIndices,
//     required this.height,
//     required this.heldItems,
//     required this.id,
//     required this.isDefault,
//     required this.locationAreaEncounters,
//     required this.moves,
//     required this.name,
//     required this.order,
//     required this.pastAbilities,
//     required this.pastTypes,
//     required this.species,
//     required this.sprites,
//     required this.stats,
//     required this.types,
//     required this.weight,
//   });
// }

// class Ability {
//   Species ability;
//   bool isHidden;
//   int slot;

//   Ability({
//     required this.ability,
//     required this.isHidden,
//     required this.slot,
//   });
// }

// class Species {
//   String name;
//   String url;

//   Species({
//     required this.name,
//     required this.url,
//   });
// }

// class GameIndex {
//   int gameIndex;
//   Species version;

//   GameIndex({
//     required this.gameIndex,
//     required this.version,
//   });
// }

// class Move {
//   Species move;
//   List<VersionGroupDetail> versionGroupDetails;

//   Move({
//     required this.move,
//     required this.versionGroupDetails,
//   });
// }

// class VersionGroupDetail {
//   int levelLearnedAt;
//   Species moveLearnMethod;
//   Species versionGroup;

//   VersionGroupDetail({
//     required this.levelLearnedAt,
//     required this.moveLearnMethod,
//     required this.versionGroup,
//   });
// }

// class GenerationV {
//   Sprites blackWhite;

//   GenerationV({
//     required this.blackWhite,
//   });
// }

// class GenerationIv {
//   Sprites diamondPearl;
//   Sprites heartgoldSoulsilver;
//   Sprites platinum;

//   GenerationIv({
//     required this.diamondPearl,
//     required this.heartgoldSoulsilver,
//     required this.platinum,
//   });
// }

// class Versions {
//   GenerationI generationI;
//   GenerationIi generationIi;
//   GenerationIii generationIii;
//   GenerationIv generationIv;
//   GenerationV generationV;
//   Map<String, Home> generationVi;
//   GenerationVii generationVii;
//   GenerationViii generationViii;

//   Versions({
//     required this.generationI,
//     required this.generationIi,
//     required this.generationIii,
//     required this.generationIv,
//     required this.generationV,
//     required this.generationVi,
//     required this.generationVii,
//     required this.generationViii,
//   });
// }

// class Sprites {
//   String backDefault;
//   dynamic backFemale;
//   String backShiny;
//   dynamic backShinyFemale;
//   String frontDefault;
//   dynamic frontFemale;
//   String frontShiny;
//   dynamic frontShinyFemale;
//   Other? other;
//   Versions? versions;
//   Sprites? animated;

//   Sprites({
//     required this.backDefault,
//     this.backFemale,
//     required this.backShiny,
//     this.backShinyFemale,
//     required this.frontDefault,
//     this.frontFemale,
//     required this.frontShiny,
//     this.frontShinyFemale,
//     this.other,
//     this.versions,
//     this.animated,
//   });
// }

// class GenerationI {
//   RedBlue redBlue;
//   RedBlue yellow;

//   GenerationI({
//     required this.redBlue,
//     required this.yellow,
//   });
// }

// class RedBlue {
//   String backDefault;
//   String backGray;
//   String backTransparent;
//   String frontDefault;
//   String frontGray;
//   String frontTransparent;

//   RedBlue({
//     required this.backDefault,
//     required this.backGray,
//     required this.backTransparent,
//     required this.frontDefault,
//     required this.frontGray,
//     required this.frontTransparent,
//   });
// }

// class GenerationIi {
//   Crystal crystal;
//   Gold gold;
//   Gold silver;

//   GenerationIi({
//     required this.crystal,
//     required this.gold,
//     required this.silver,
//   });
// }

// class Crystal {
//   String backDefault;
//   String backShiny;
//   String backShinyTransparent;
//   String backTransparent;
//   String frontDefault;
//   String frontShiny;
//   String frontShinyTransparent;
//   String frontTransparent;

//   Crystal({
//     required this.backDefault,
//     required this.backShiny,
//     required this.backShinyTransparent,
//     required this.backTransparent,
//     required this.frontDefault,
//     required this.frontShiny,
//     required this.frontShinyTransparent,
//     required this.frontTransparent,
//   });
// }

// class Gold {
//   String backDefault;
//   String backShiny;
//   String frontDefault;
//   String frontShiny;
//   String? frontTransparent;

//   Gold({
//     required this.backDefault,
//     required this.backShiny,
//     required this.frontDefault,
//     required this.frontShiny,
//     this.frontTransparent,
//   });
// }

// class GenerationIii {
//   OfficialArtwork emerald;
//   Gold fireredLeafgreen;
//   Gold rubySapphire;

//   GenerationIii({
//     required this.emerald,
//     required this.fireredLeafgreen,
//     required this.rubySapphire,
//   });
// }

// class OfficialArtwork {
//   String frontDefault;
//   String frontShiny;

//   OfficialArtwork({
//     required this.frontDefault,
//     required this.frontShiny,
//   });
// }

// class Home {
//   String frontDefault;
//   dynamic frontFemale;
//   String frontShiny;
//   dynamic frontShinyFemale;

//   Home({
//     required this.frontDefault,
//     this.frontFemale,
//     required this.frontShiny,
//     this.frontShinyFemale,
//   });
// }

// class GenerationVii {
//   DreamWorld icons;
//   Home ultraSunUltraMoon;

//   GenerationVii({
//     required this.icons,
//     required this.ultraSunUltraMoon,
//   });
// }

// class DreamWorld {
//   String frontDefault;
//   dynamic frontFemale;

//   DreamWorld({
//     required this.frontDefault,
//     this.frontFemale,
//   });
// }

// class GenerationViii {
//   DreamWorld icons;

//   GenerationViii({
//     required this.icons,
//   });
// }

// class Other {
//   DreamWorld dreamWorld;
//   Home home;
//   OfficialArtwork officialArtwork;

//   Other({
//     required this.dreamWorld,
//     required this.home,
//     required this.officialArtwork,
//   });
// }

// class Stat {
//   int baseStat;
//   int effort;
//   Species stat;

//   Stat({
//     required this.baseStat,
//     required this.effort,
//     required this.stat,
//   });
// }

// class Type {
//   int slot;
//   Species type;

//   Type({
//     required this.slot,
//     required this.type,
//   });
// }
