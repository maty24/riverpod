import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      //de la data solo me traiga el name
      return response.data['name'] ?? 'name not found';
    } catch (e) {
      throw Exception('Name not found');
    }
  }
}
