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
    Data(name: 'khan', number: 20, rating: 5.5),
    Data(name: 'ahmad', number: 8, rating: 2.5),
    Data(name: 'zubari', number: 76, rating: 7.5),
    Data(name: 'abdullah', number: 20, rating: 5.5),
    Data(name: 'adil', number: 8, rating: 2.5),
    Data(name: 'zohaib', number: 76, rating: 7.5),
    Data(name: 'kmran', number: 20, rating: 5.5),
    Data(name: 'sohail', number: 8, rating: 2.5),
    Data(name: 'sahil', number: 76, rating: 7.5),
    Data(name: 'soduas', number: 20, rating: 5.5),
    Data(name: 'ahmad', number: 8, rating: 2.5),
    Data(name: 'zubari', number: 76, rating: 7.5),
  ];
  List searchResult=[];

  void search (String query)
  {
   setState(() {
     
   searchResult = names
          .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
   });

  }
  // void sortRating() {
  //   names.sort(
  //     (a, b) {
  //       return (a.rating.compareTo(b.rating));
  //     },
  //   );
  //   setState(() {
      
  //   });
  // }

  // List<String> fruits = ['apple', 'mango', 'graps', 'orange'];
  // void refreshList() {
  //   fruits.clear();
  //   fruits.addAll(['goat', 'cow', 'lion']);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Search '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                onChanged: search,
                decoration: InputDecoration(
                  hintText: 'Search ... '
                ),
              ),
              ListView.builder(
                  itemCount: names.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Text(names[index].name.toString(),style: TextStyle(fontSize: 50),);
                  })),
              // Text(names.contains('apple') ? 'data' : ''),
              const SizedBox(
                height: 50,
              ),
              // ListView.builder(
              //   itemCount: names.length,
              //     scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemBuilder: ((context, index) {
        
              //   return ListTile(
              //     leading: Text(names[index].name.toString()),
              //     subtitle: Text(names[index].number.toString()),
              //     trailing: Text(names[index].rating.toStringAsFixed(2)),
              //   );
                
              // })),
              // ElevatedButton(
              //     onPressed: () {
              //       // refreshList();
              //       // sortRating();
              //     },
              //     child: Text('add'))
            ],
          ),
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
