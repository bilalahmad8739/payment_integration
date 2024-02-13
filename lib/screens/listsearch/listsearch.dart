import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListSearch extends StatefulWidget {
  const ListSearch({Key? key}) : super(key: key);

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch>
    with SingleTickerProviderStateMixin {
  List<Data> names = [
    Data(name: 'bilal', number: 10, rating: 4.5, meaning: 'بلال'),
    Data(name: 'khan', number: 20, rating: 5.5, meaning: 'خان'),
    // Add meanings for other words
  ];
  List<Data> searchResult = [];

  TextEditingController searchController = TextEditingController();

  late stt.SpeechToText _speech;
  String _spokenWord = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    if (await _speech.initialize()) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            _spokenWord = result.recognizedWords;
          });

          // Automatically trigger the search when a word is spoken
          search(_spokenWord);
        },
      );
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  void search(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResult.clear();
      } else {
        searchResult = names
            .where((item) =>
                item.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void handleItemTap(String selectedWord) {
    Data selectedData =
        names.firstWhere((data) => data.name == selectedWord, orElse: () {
      return Data(name: '', number: 0, rating: 0.0, meaning: '');
    });

    if (selectedData.name!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MeaningScreen(meaning: selectedData.meaning),
        ),
      );
    }

    setState(() {
      searchController.text = selectedWord;
      searchResult.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Search '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: search,
                      decoration: const InputDecoration(
                        hintText: 'Search ... ',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      if (!_speech.isListening) {
                        _speech.listen(onResult: (result) {
                          setState(() {
                            _spokenWord = result.recognizedWords;
                          });
                        });
                      } else {
                        _speech.stop();
                      }
                    },
                  ),
                ],
              ),
              if (searchResult.isNotEmpty)
                ListView.builder(
                  itemCount: searchResult.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () =>
                          handleItemTap(searchResult[index].name!),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          searchResult[index].name.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }),
                )
              else if (searchController.text.isNotEmpty && searchResult.isEmpty)
                const Text('No results found')
              else
                const SizedBox(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeaningScreen extends StatelessWidget {
  final String meaning;

  const MeaningScreen({Key? key, required this.meaning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Meaning in Urdu'),
      ),
      body: Center(
        child: Text(
          meaning,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Data {
  final String? name;
  final int number;
  final double rating;
  final String meaning;

  Data({
    required this.rating,
    required this.number,
    required this.name,
    required this.meaning,
  });
}
