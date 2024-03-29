import 'dart:math';
import 'dart:ui';

final _random = Random();

/* ....... */
// Using Color.fromARGB
final _randomColor = Color.fromARGB(
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256)
);

// Using Color.fromRGBO
final _anotherRandomColor = Color.fromRGBO(
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextDouble()
);
