import 'package:email_hub/about_screen.dart';
import 'package:email_hub/contact_screen.dart';
import 'package:email_hub/splash_screen.dart';
import 'package:flutter/material.dart';


void main() { runApp(const MyApp()); }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mail Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String currentPage = 'My Users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('$currentPage'),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                ),
                accountName: Text("John Apppleseed"),
                accountEmail: Text("johnappleseds@example.com")
            ),

            ListTile(
              title: Text("My Users"),
              onTap: () {
                Navigator.pop(context);
                setState(() { currentPage = 'My Users'; });
              },
            ),

            ListTile(
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
                setState(() { currentPage = 'About'; });
              },
            ),
          ],
        ),
      ),

      body: getTappedPage(),

    );
  }

  // a simple widget to handle page changing from drawer
  Widget getTappedPage() {

    switch (currentPage) {
        // main page
      case 'My Users':
        return ContactScreen();
        // introduction page
      case 'About':
        return AboutScreen();
        // default page
      default:
        return ContactScreen();
    }
  }

}