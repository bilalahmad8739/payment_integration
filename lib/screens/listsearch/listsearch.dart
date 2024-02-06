import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({super.key});

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch>
    with SingleTickerProviderStateMixin {
  List<Data> names = [
    Data(name: 'bilal', number: 10, rating: 4.5),
    Data(name: 'bilal', number: 20, rating: 5.5),
    Data(name: 'bilal', number: 8, rating: 2.5),
    Data(name: 'bilal', number: 76, rating: 7.5),
  ];
  void sortRating() {
    names.sort(
      (a, b) {
        return (a.rating.compareTo(b.rating));
      },
    );
    setState(() {
      
    });
  }

  List<String> fruits = ['apple', 'mango', 'graps', 'orange'];
  void refreshList() {
    fruits.clear();
    fruits.addAll(['goat', 'cow', 'lion']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Search '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListView.builder(
                itemCount: fruits.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Text(fruits[index]);
                })),
            Text(fruits.contains('apple') ? 'data' : ''),
            SizedBox(
              height: 50,
            ),
            ListView.builder(
              itemCount: names.length,
                scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: ((context, index) {

              return ListTile(
                leading: Text(names[index].name.toString()),
                subtitle: Text(names[index].number.toString()),
                trailing: Text(names[index].rating.toStringAsFixed(2)),
              );
              
            })),
            ElevatedButton(
                onPressed: () {
                  // refreshList();
                  sortRating();
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }
}

class Data {
  final String? name;
  final int number;
  final double rating;
  Data({
    required this.rating,
    required this.number,
    required this.name,
  });
}
