import 'asanas.dart';

class AsanaList {
  List<Asanas> _asanaList = [
    Asanas(1, 'Trikonasana'),
    Asanas(2, 'Vrukshasana'),
    Asanas(3, 'Virabhadrasana'),
    Asanas(4, 'Paravakonasana'),
    Asanas(5, 'Ardha chandrasana'),
    Asanas(6, 'Tadasana'),
    Asanas(7, 'Natrajasana'),
    Asanas(8, 'Anjaneasana'),
  ];

  String getAsanaName(int index) {
    return _asanaList[index].asanaName;
  }
}
