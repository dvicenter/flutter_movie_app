import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/media_list/media_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Header'),
            ),
            ListTile(
              title: Text('Peliculas'),
              trailing: Icon(Icons.local_movies),
            ),
            ListTile(
              title: Text('Televisión'),
              trailing: Icon(Icons.live_tv),
            ),
            ListTile(
              title: Text('Cerrar'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: [
          MediaList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
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
