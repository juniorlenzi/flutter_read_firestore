import 'package:firebase_fstore/model/city.model.dart';
import 'package:firebase_fstore/service/firebase.dart';
import 'package:flutter/material.dart';

class CitiesCountriesPage extends StatefulWidget {
  const CitiesCountriesPage({Key? key, required this.country}) : super(key: key);

  final String country;

  @override
  State<CitiesCountriesPage> createState() => _CitiesCountriesPageState();
}

class _CitiesCountriesPageState extends State<CitiesCountriesPage> {
  List<City> cities = [];

  @override
  void initState() {
    _loadCities();
    super.initState();
  }

  _loadCities() async {
    cities = await FirebaseService.loadCitiesByCountry(widget.country);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (cities.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Material(
      child: ListView.builder(
          itemCount: cities.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final City city = cities[index];
            return ListTile(
                title: Text(city.name.toString()),
                onTap: () {
                  Navigator.pop(context);
                });
          }),
    );
  }
}
