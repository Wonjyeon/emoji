import 'package:emoji/post_provider.dart';
import 'package:emoji/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/post.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int _selectIndex = 0;
  final List<IconData> icons = [
    MdiIcons.emoticonHappy,
    MdiIcons.emoticonSad,
    MdiIcons.emoticonAngry,
    MdiIcons.emoticonConfused,
    MdiIcons.emoticonExcited,
    MdiIcons.emoticonWink,
    MdiIcons.emoticonKiss
  ];

  IconData icon;
  String title;
  String body;

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    PostProvider provider = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.backspace, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today, I\'m',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff69E3C8),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectIndex = index;
                        });
                      },
                      child: Icon(
                        icons[index],
                        size: 60,
                        color: _selectIndex == index
                            ? Color(0xff69E3C8)
                            : Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'title',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff69E3C8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                initialValue: title,
                onSaved: (newValue) => title = newValue,
                onChanged: (value) => title = value,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'body',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff69E3C8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                initialValue: body,
                onSaved: (newValue) => body = newValue,
                onChanged: (value) => body = value,
              ),
              RaisedButton(
                child: Text(
                  '등록',
                ),
                onPressed: () {
                  _formkey.currentState.save();
                  Post _post = new Post(
                      title: title, body: body, icon: icons[_selectIndex]);
                  provider.addPost(_post);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
