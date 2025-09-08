String typeImagePokemon(String type) {
  switch (type.toString().toLowerCase()) {
    case 'water':
      return 'assets/images/ic_water.svg';
    case 'dragon':
      return 'assets/images/ic_dragon.svg';
    case 'electric':
      return 'assets/images/ic_electric.svg';
    case 'fairy':
      return 'assets/images/ic_fairy.svg';
    case 'ghost':
      return 'assets/images/ic_ghost.svg';
    case 'fire':
      return 'assets/images/ic_fire.svg';
    case 'ice':
      return 'assets/images/ic_ice.svg';
    case 'bug':
      return 'assets/images/ic_bug.svg';
    case 'fighting':
      return 'assets/images/ic_fighting.svg';
    case 'normal':
      return 'assets/images/ic_normal.svg';
    case 'dark':
      return 'assets/images/ic_dark.svg';
    case 'steel':
      return 'assets/images/ic_steel.svg';
    case 'rock':
      return 'assets/images/ic_rock.svg';
    case 'psychic':
      return 'assets/images/ic_psychic.svg';
    case 'ground':
      return 'assets/images/ic_ground.svg';
    case 'poison':
      return 'assets/images/ic_poison.svg';
    case 'flying':
      return 'assets/images/ic_flying.svg';
    default:
      return 'assets/images/ic_water.svg';
  }
}
