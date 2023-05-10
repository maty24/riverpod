import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/provider/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //el build no puede ser asyncrono

    final pokemonId = ref.watch(pokemonIdProvider);
    //cuando defini esto la peticion ya se disparo
    //le tengo que enviar un valor al family
    final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('pokemon: $pokemonId'),
      ),
      body: Center(
        //el when para manejo de erroes
        child: pokemonAsync.when(
            //si hay data me retorna el valor
            data: (value) => Text(value),
            //si hay un error me reterona el codigo
            error: (error, stackTrace) => Text('Error: $error'),
            //si esta cargando no hay argumentos y retorno algo
            loading: () => const CircularProgressIndicator()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
              child: const Icon(Icons.plus_one),
              onPressed: () {
                //esto es para actualizar el estado y se ocupa un read porque es una funcion y .notifer para actualizar el estado
                ref
                    .read(pokemonIdProvider.notifier)
                    .update((state) => state + 1);
              }),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
              child: const Icon(Icons.exposure_minus_1_outlined),
              onPressed: () {
                ref
                    .read(pokemonIdProvider.notifier)
                    .update((state) => state - 1);
              })
        ],
      ),
    );
  }
}
