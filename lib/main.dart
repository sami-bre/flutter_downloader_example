
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug: true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _downloadFile() async {
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://mynodejsdemobucket.s3.amazonaws.com/1701434586614_coloring_willd_animals_drawing.pdf',
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: '/storage/emulated/0/Download',
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'press the FAB to download the pdf.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _downloadFile,
        tooltip: 'download',
        child: const Icon(Icons.download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
