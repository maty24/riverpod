import 'package:random_name_generator/random_name_generator.dart';

//me genera numeros random en español y fullname
class RandomGeneration {
  static String getRandomNames() {
    final randomNames = RandomNames(Zone.spain);
    return randomNames.fullName();
  }

  static Stream<String> randomNamesStream() {
    //el stream.periodic es para que se ejecute cada cierto tiempo
    return Stream.periodic(const Duration(seconds: 2), (i) {
      print('Strea new vaue');
      //cada 2 segundos me va a devolver un nombre random
      return getRandomNames();
    });
  }
}
