import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverApp'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  //no le pongo super.key porque es una clase privada
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    //el listview es un widget que me permite poner una lista de widgets
    return ListView(
      children: const [
        _CustomListTile(
            title: 'Counter',
            subtitle: 'A simple counter',
            location: '/state_provider'),
        _CustomListTile(
            title: 'Future provider',
            subtitle: 'A simple future + famili',
            location: '/future_provider'),
        _CustomListTile(
            title: 'Stream provider',
            subtitle: 'A simple stream',
            location: '/stream_provider'),
        _CustomListTile(
            title: 'State Notifier provider',
            subtitle: 'un provider estado personalizado',
            location: '/state-notifer-provider'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;

  const _CustomListTile(
      {required this.title, required this.subtitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      //estoy usando el goRouter para navegar a la ruta
      onTap: () => context.push(location),
    );
  }
}
