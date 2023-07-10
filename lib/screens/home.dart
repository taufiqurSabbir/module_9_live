import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../recipejson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipes();
  }

  List<Recipe> Recipes = [];

  void recipes() async {
    final String response = await rootBundle.loadString('asset/recipe.json');
    final Map<String, dynamic> decode = jsonDecode(response);
    print(decode);
    if (response.isNotEmpty) {
      decode['recipes'].forEach((e) {
        Recipes.add(Recipe.fromJson(e));
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Food Recipes'),
        ),
        body: ListView.builder(
            itemCount: Recipes.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.fastfood),
                title: Text(Recipes[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                subtitle: Text(Recipes[index].description),
              );
            }));
  }
}
