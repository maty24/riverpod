import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

//el autoDispose es para que cuando se destruya el provider se destruya el objeto, esto se destroza cuando se sale de la pantalla
final randomNamesProvider = StateProvider.autoDispose<String>((ref) {
  //como es un objeto estatico no necesito instanciarlo
  return RandomGeneration.getRandomNames();
});
