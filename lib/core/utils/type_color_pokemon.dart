import 'package:flutter/material.dart';
import 'package:pokedex_app/core/styles/style_color.dart';

Color typeColorPokemon(String type) {
  switch (type.toLowerCase()) {
    case 'water':
      return StyleColor.water;
    case 'dragon':
      return StyleColor.dragon;
    case 'electric':
      return StyleColor.electric;
    case 'fairy':
      return StyleColor.fairy;
    case 'ghost':
      return StyleColor.ghost;
    case 'fire':
      return StyleColor.fire;
    case 'ice':
      return StyleColor.ice;
    case 'grass':
      return StyleColor.grass;
    case 'bug':
      return StyleColor.insect;
    case 'fighting':
      return StyleColor.fighter;
    case 'normal':
      return StyleColor.normal;
    case 'dark':
      return StyleColor.nocturnal;
    case 'steel':
      return StyleColor.metal;
    case 'rock':
      return StyleColor.stone;
    case 'psychic':
      return StyleColor.psychic;
    case 'ground':
      return StyleColor.terrestrial;
    case 'poison':
      return StyleColor.poisonous;
    case 'flying':
      return StyleColor.flying;
    default:
      return StyleColor.allType;
  }
}
