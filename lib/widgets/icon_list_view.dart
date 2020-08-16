import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconListView extends StatefulWidget {
  int selectedIndex;
  List<IconData> icons;

  IconListView({this.icons, this.selectedIndex});
  @override
  _IconListViewState createState() => _IconListViewState();
}

class _IconListViewState extends State<IconListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.icons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
              child: Icon(
                widget.icons[index],
                size: 60,
                color: widget.selectedIndex == index
                    ? Color(0xff69E3C2)
                    : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
