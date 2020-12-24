import 'package:flutter/material.dart';
import 'CreateSettle.dart';
import 'JoinSettle.dart';

void main() {
  runApp(SettleApp());
}

class SettleApp extends StatelessWidget {
  // This widget is the root of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettleHomePage(title: 'Settle'),
    );
  }
}

class SettleHomePage extends StatefulWidget {
  SettleHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  // From dart.dev: The => expr syntax is a shorthand for { return expr; }
  @override
  _SettleHomePageState createState() => _SettleHomePageState();
}

class _SettleHomePageState extends State<SettleHomePage> {

  // Called when 'Create a Settle' button is pressed
  void _createASettlePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateSettle()),
    );
  }

  // Called when 'Join a Settle' button is pressed
  void _joinASettlePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JoinSettle()),
    );
  }

  // Called when the information button is pressed
  void _informationPressed() {
    // TODO
  }

  // Called when the settings button is pressed
  void _settingsPressed() {
    // TODO
  }

  @override
  // This method is rerun every time setState is called.
  //
  // The Flutter framework has been optimized to make rerunning build methods
  // fast, so that you can just rebuild anything that needs updating rather
  // than having to individually change instances of widgets.
  Widget build(BuildContext context) {

    final settleButtonWidth = 150.0;
    final settleButtonHeight = 45.0;
    final settleButtonTextStyle = new TextStyle(fontSize: 16.4,);

    final createSettleButton = SizedBox(
      width: settleButtonWidth,
      height: settleButtonHeight,
      child: ElevatedButton(
        onPressed: _createASettlePressed,
        child: Text('Create a Settle',
          style: settleButtonTextStyle),
      ),
    );
    final joinSettleButton = SizedBox(
      width: settleButtonWidth,
      height: settleButtonHeight,
      child: ElevatedButton(
        onPressed: _joinASettlePressed,
        child: Text('Join a Settle',
          style: settleButtonTextStyle),
      ),
    );
    final settleButtonMargin = EdgeInsets.all(18.0);
    final miscButtonSize = 30.0;

    /**
     * The home screen is made of an expanded stack that takes up the entire
     * screen and draws widgets in the center of the screen by default. The
     * Settle buttons are drawn in a column in the center of the stack/screen,
     * the info button is drawn in the bottom left of the stack/screen, and the
     * settings button is drawn in the bottom right of the stack/screen.
     */
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column( // Settle buttons in the center
                    mainAxisSize: MainAxisSize.min, // Size to only needed space
                    children: <Widget>[
                      Container(
                        margin: settleButtonMargin,
                        child: createSettleButton,
                      ),
                      Container(
                        margin: settleButtonMargin,
                        child: joinSettleButton,
                      )
                    ],
                  ),
                  Align( // Info button in the bottom left
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.info),
                      iconSize: miscButtonSize,
                      tooltip: 'Information about Settle',
                      onPressed: _informationPressed,
                    ),
                  ),
                  Align( // Settings button in the bottom right
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: miscButtonSize,
                      tooltip: 'Settle settings',
                      onPressed: _settingsPressed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}