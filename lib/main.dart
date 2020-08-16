import 'package:emoji/add_screen.dart';
import 'package:emoji/post_provider.dart';
import 'package:emoji/widgets/icon_list_view.dart';
import 'package:emoji/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/add_screen': (context) => AddScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostProvider>(
        create: (_) => PostProvider(),
        child: Consumer<PostProvider>(builder: (_, provider, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_screen',
                    arguments: provider);
              },
              backgroundColor: Colors.white,
              child: Icon(
                MdiIcons.plus,
                color: Color(0xff69E3C2),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              elevation: 0,
              title: Row(
                children: <Widget>[
                  Icon(
                    MdiIcons.emoticonWinkOutline,
                    size: 40,
                    color: Colors.purple[300],
                  ),
                  Text(
                    'EMOJI',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple[300],
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.2,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: provider.posts.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    post: provider.posts[index],
                  );
                },
              ),
            ),
          );
        }));
  }
}
