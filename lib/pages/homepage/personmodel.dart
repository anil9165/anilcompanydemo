import 'package:anilmastertest/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:anilmastertest/pages/homepage/model.dart';

import '../../color_constant.dart';

class homePage extends StatelessWidget {
  List<Person> _Persons = [
    Person(
      id: 1,
      name: "Anil",
      email: "anilqnahar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
    Person(
      id: 2,
      name: "nahar",
      email: "anilwahar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
    Person(
      id: 3,
      name: "demo",
      email: "anilaahar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
    Person(
      id: 4,
      name: "ani",
      email: "aninchar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
    Person(
      id: 5,
      name: "Asnd",
      email: "aniclahar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
    Person(
      id: 6,
      name: "Anuu",
      email: "anilahar0@gmail.com",
      imgUrl: "assets/images/anil.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "My Visits",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: store.state.todos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          var todo = store.state.todos[index];
          return Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                const SizedBox(
                  height: 2,
                ),
                Image.asset(
                  _Persons[0].imgUrl,
                  height: 150,
                  width: 160,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  todo.id?.toString() ?? "Hello",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  todo.title ?? "Hello",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]));
        },
      ),
    );
  }
}
