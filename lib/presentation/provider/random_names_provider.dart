import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

//el aysnc* es para que sea un stream sin * es un future, el autoDispose es para que cuando se destruya el provider se destruya el objeto, esto se destroza cuando se sale de la pantalla
final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
//estoy esperando cada emision del stream y me devuelve el nombre
  await for (final name in RandomGeneration.randomNamesStream()) {
    yield name;
  }
});


// //el aysnc* es para que sea un stream sin * es un future
// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
//   //durante 2 segundos no va a devolver nada
//   await Future.delayed(const Duration(seconds: 2));
//   //el yield es como el return pero para los streams
//   yield [];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['matias'];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['matias', 'jose'];
//   await Future.delayed(const Duration(seconds: 2));

//   yield ['matias', 'jose', 'maria'];
// });
