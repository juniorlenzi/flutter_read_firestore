class City {
  String? name;

  City(this.name);

  City.fromSnapshot(snapshot) {
    name = snapshot['city'];
  }
}
