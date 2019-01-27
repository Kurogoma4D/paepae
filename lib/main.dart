import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ぺーぺー',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.grey,
          textTheme: TextTheme(
              body1: TextStyle(fontSize: 12),
              subhead: TextStyle(fontSize: 14))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;
  final int _infoLength = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            height: 360,
            padding: EdgeInsets.only(top: 36),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.menu,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "ぺーぺー",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.notifications,
                        size: 36,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Card(
                  elevation: 12,
                  child: SizedBox(
                    height: 180,
                    width: 0.75 * width,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange[200], Colors.pink[400]])),
          ),
          _buildUnder()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              title: Text("ホーム")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              title: Text("残高")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_from_queue,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              title: Text("スキャン支払い")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              title: Text("コード支払い")),
        ],
        currentIndex: _selectedItem,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  Widget _buildUnder() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 36, 0, 8),
            child: Text(
              "直近の利用履歴",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            height: 120,
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: ListTile(
                  leading: SizedBox(
                    width: 48,
                    height: 48,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400]),
                      ),
                      child: Center(
                        child: Icon(Icons.receipt),
                      ),
                    ),
                  ),
                  title: Text("まだお支払いがありません！"),
                  subtitle: Text("ぺーぺーで支払ってボーナスを獲得しよう"),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: Text("インフォメーション", style: TextStyle(color: Colors.grey)),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //padding: EdgeInsets.all(16),
              itemCount: _infoLength,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Placeholder(
                      fallbackWidth: 220,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          )
        ],
    );
  }
}
