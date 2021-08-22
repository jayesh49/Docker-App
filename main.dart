import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
];

List<Widget> _tiles = const <Widget>[
  const MyItems(Icons.apps_rounded, "Images", 0xffed622b, "/first"),
  const MyItems(
      Icons.amp_stories_rounded, "Running Contrs", 0xff26cb3c, "/second"),
  const MyItems(
      Icons.app_registration_rounded, "All Containers", 0xff3399fe, "/third"),
  const MyItems(Icons.amp_stories_outlined, "Launch", 0xfff4c83f, "/fourth"),
  const MyItems(Icons.build_circle_outlined, "Remove", 0xff622F74, "/fifth"),
  const MyItems(
      Icons.my_library_books_outlined, "Linux Terminal", 0xff7297ff, "/sixth"),
  //const _Example01Tile(Colors.blue, Icons.radio),
];

class Example01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Docker Go'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            )));
  }
}

class MyItems extends StatelessWidget {
  const MyItems(this.icon, this.heading, this.color, this.routeName);

  final int color;
  final IconData icon;
  final String heading;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 12.0,
      shadowColor: Color(0xff2962ff),
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Text here
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            heading,
                            style: TextStyle(
                              color: new Color(color),
                              fontSize: 18.0,
                            ),
                          ),
                        ), //text

                        //icon
                        Material(
                          color: new Color(color),
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: IconButton(
                              icon: Icon(icon),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, routeName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kubernetes Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Example01(),
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
        '/fifth': (context) => FifthScreen(),
        '/sixth': (context) => SixthScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  late String output = "";
  func() async {
    var cmd = "docker images";
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show Pods"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  late String output = "";
  func() async {
    var cmd = "docker ps";
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show Deploy"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreen createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen> {
  late String output = "";
  func() async {
    var cmd = "docker ps -a";
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show service"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreen createState() => _FourthScreen();
}

class _FourthScreen extends State<FourthScreen> {
  final name = TextEditingController();
  final image = TextEditingController();
  final tag = TextEditingController();
  late String output = "";
  func() async {
    cmd = "docker run -itd --name " +
        name.text +
        " " +
        image.text +
        ":" +
        tag.text;
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Launch a Container"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter container name: "),
            TextField(
              controller: name,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "myos1",
              ),
            ),
            Text("Enter image name: "),
            TextField(
              controller: image,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "httpd",
              ),
            ),
            Text("Enter tag name: "),
            TextField(
              controller: tag,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "latest",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  _FifthScreen createState() => _FifthScreen();
}

class _FifthScreen extends State<FifthScreen> {
  final id = TextEditingController();
  late String output = "";
  func() async {
    cmd = "docker rm -f " + id.text;
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Delete a container"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter container name/id: "),
            TextField(
              controller: id,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "myos1",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class SixthScreen extends StatefulWidget {
  const SixthScreen({Key? key}) : super(key: key);

  @override
  _SixthScreen createState() => _SixthScreen();
}

class _SixthScreen extends State<SixthScreen> {
  late String output = "";
  func() async {
    var r = await http
        .get(Uri.http("192.168.99.101", "/cgi-bin/Kubernetes.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Linux"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Redhat 8 terminal: "),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "Enter Linux command",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}
