import 'package:hive/hive.dart';

void main() async {
  var box = await Hive.openBox('sample');
  box.put('sample', 'vjgvf');
  box.get('sample');
}
