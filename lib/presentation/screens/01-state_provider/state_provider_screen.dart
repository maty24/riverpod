import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/provider/providers.dart';

//es un consumer widget porque va a consumir el provider
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  //le pongo widgetRef para que se pueda acceder a todos los providers
  Widget build(BuildContext context, WidgetRef ref) {
    //esto hace que se pueda acceder a los estilos de la app en este caso el titleMedium
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    //con el watch solo puedo acceder al valor del provider
    final name = ref.watch(randomNamesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        //le pongo style al text para que se vea el estilo que le puse en el theme
        child: Text(name, style: titleStyle),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: () {
          //estoy invalidando el provider para que de ejecute de nuevo y me de un nuevo nombre
          ref.invalidate(randomNamesProvider);

          //cuando es una funcion se pone un read y el notifier es para notificar que se cambio el valor a los widgets que estan escuchando
          //ref.read(randomNamesProvider.notifier)
        },
      ),
    );
  }
}
