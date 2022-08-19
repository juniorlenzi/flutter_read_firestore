import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_fstore/model/city.model.dart';
import 'package:firebase_fstore/model/country.model.dart';

class FirebaseService {
  // com.jrlenzismash.app

  static Future<void> initializeApp() async {
    await Firebase.initializeApp();
  }

  static Future<List<Country>> loadCountries() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore.collection('countries').get();

    final List<DocumentSnapshot> documents = querySnapshot.docs;
    List<Country> countries = [];
    documents.map((DocumentSnapshot document) => countries.add(Country.fromSnapshot(document.data()))).toList();

    return countries;
  }

  static Future<List<City>> loadCitiesByCountry(String countryName) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore.collection('countries').doc(countryName).collection('cities').get();

    final List<DocumentSnapshot> documents = querySnapshot.docs;
    List<City> cities = [];
    documents.map((DocumentSnapshot document) => cities.add(City.fromSnapshot(document.data()))).toList();

    return cities;
  }
}
