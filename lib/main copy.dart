import 'package:flutter/material.dart';
import 'package:probando_flutter/pages/registrar_avance.dart';
import 'package:probando_flutter/utils/flutter/HexColor.dart';

void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        body: Container(
      child: MyBottomTabs(),
      color: Colors.red,
      height: data.size.height,
    ));
  }
}

class MyBottomTabs extends StatefulWidget {
  _MyBottomTabsState createState() => _MyBottomTabsState();
}

class _MyBottomTabsState extends State<MyBottomTabs>
    with SingleTickerProviderStateMixin {
  var nombreModuloArr = ["Registrar Tareo","Listar Tareo","Registrar Avance","Listar Avance"];
  String nombreModulo = "Registrar Tareo";
  TabController bottomTabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomTabController = new TabController(length: 5, vsync: this);
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[new AccountPage(),new AccountPage()],
    );
  }

  int bottomSelectedIndex = 0;

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
      nombreModulo = nombreModuloArr[index];
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;

      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(nombreModulo),
        backgroundColor: Colors.redAccent,
      ),
      body: buildPageView(),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: HexColor('#4D4D4D'),
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: HexColor(
                        '#A6A6A6')))), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomSelectedIndex,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.timer),
              title: new Text("Tareo"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.list),
              title: new Text("Listar Tareo"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: new Text("Avance"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.list),
              title: new Text("Listar Avance"),
            )
          ],
          onTap: (int i) {
            bottomTapped(i);
          },
        ),
      ),
    );
  }
}
