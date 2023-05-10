import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

//el family es para que pueda recibir argumentos
final pokemonNameProvider = FutureProvider.family<String,int>((ref,id) async {
  //llamo a un static de la clase , en este caso llamo getpokemonname
  final name = await PokemonService.getPokemonName(id);
  return name;
});
