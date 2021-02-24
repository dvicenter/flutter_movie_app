import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/media_list/media_list.dart';
import 'package:flutter_movie_app/ui/media_list/media_top_rated.dart';
import 'package:flutter_movie_app/ui/media_list/media_upcoming.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> _childrenPageView = [
    MediaList(),
    MediaUpcoming(),
    MediaTopRated(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: PageStorage(
        child: _childrenPageView[_selectedIndex],
        bucket: _bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _getFooterItems(),
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: 'Populares',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: 'Proximamente',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Mejor valoradas',
      ),
    ];
  }
}
