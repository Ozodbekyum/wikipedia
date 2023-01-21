import 'package:flutter/material.dart';
import 'package:wikipedia/model/music_model.dart';

void main() {
  runApp(const WikipediaApp());
}

class WikipediaApp extends StatelessWidget {
  const WikipediaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MusicModel> main_musics_list = [
    MusicModel('Love me(Bluefin Remix)', 'Zyrex'),
    MusicModel('Comfort Chain', 'Instupendo'),
    MusicModel('Play date', 'Melanie Martinez'),
    MusicModel('Dandelions', 'Ruth B.'),
    MusicModel('Bad Habit', 'Steve Lacy'),
    MusicModel('METAMORPHOSIS', 'INTERWORLD'),
    MusicModel('Rises the moon', 'Liana Flores'),
    MusicModel('No Idea', 'Don Toliver'),
    MusicModel('InEssence', 'KA\$TRO'),
    MusicModel('Another Love', 'Tom Odell'),
    MusicModel('Falling', 'unkown'),
    MusicModel('amend', 'j^p^n'),
    MusicModel('Yummy', 'Justin Bieber'),
    MusicModel('Starboy', 'The Weekend'),
    MusicModel('Moonlight', 'XXXTENTACION'),
  ];

  List<MusicModel> display_list = List.from(main_musics_list);

  void updateList(String value) {
    setState(() {
      display_list = main_musics_list
          .where((element) =>
              element.music_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for a Music',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'eg: Moonlight',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    display_list[index].music_title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    display_list[index].music_singer!,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
