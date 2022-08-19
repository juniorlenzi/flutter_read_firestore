import 'package:firebase_fstore/model/city.model.dart';

class Country {
  String? name;
  List<City>? cities;

  Country(this.name, this.cities);

  Country.fromSnapshot(snapshot) {
    name = snapshot['country'];
  }
}
