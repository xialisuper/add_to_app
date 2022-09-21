import 'package:add_to_app_flutter/api.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(const MyApp(
      titleName: '默认入口',
    ));

@pragma('vm:entry-point')
void runAnotherEntry() =>
    runApp(const MyApp(
      titleName: '新入口的界面',
    ));

@pragma('vm:entry-point')
void runSecondEntry() =>
    runApp(const MyApp(
      titleName: '第二入口的界面',
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.titleName});

  final String titleName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: titleName),
    );
  }
}

class FlutterApiHandler extends FlutterBookApi {
  @override
  void displayBookDetails(Book book) {

    print(book.toString());
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    

  }

  void _searchForBook() async {
    List<Book?> books = await HostBookApi().search('book');

    for (Book? book in books) {
      print(book?.title);
      print(book?.author?.name);
      print(book?.author?.age);
    }
  }

  void _asyncSearchForBook() async {
    List<Book?> books = await HostBookApi().asyncSearch('book');

    for (Book? book in books) {
      print(book?.title);
      print(book?.author?.name);
      print(book?.author?.age);
    }
  }


  void _searchWithTitle() async {
    Author author = await HostBookApi().searchWithTitle('arg_title');
    print(author);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _searchForBook,
              child: const Text('SearchForBook'),
            ),
            ElevatedButton(
              onPressed: _asyncSearchForBook,
              child: const Text('AsyncSearchForBook'),
            ),
            ElevatedButton(
              onPressed: _searchWithTitle,
              child: const Text('SearchWithTitle'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
