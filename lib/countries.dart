import 'package:firebase_fstore/cities_countries.dart';
import 'package:firebase_fstore/model/country.model.dart';
import 'package:firebase_fstore/model/country.model.dart';
import 'package:firebase_fstore/service/firebase.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List<Country> countries = [];

  @override
  void initState() {
    _loadCountries();
    super.initState();
  }

  _loadCountries() async {
    countries = await FirebaseService.loadCountries();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (countries.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Material(
      child: ListView.builder(
          itemCount: countries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final Country country = countries[index];
            return ListTile(
              title: Text(country.name.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CitiesCountriesPage(country: country.name.toString()),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_right),
            );
          }),
    );
  }
}
