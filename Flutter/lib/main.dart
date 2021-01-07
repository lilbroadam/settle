import 'package:Settle/NameScreen.dart';
import 'package:Settle/SettleCards.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final String title;

  @override
  _SettleHomePageState createState() => _SettleHomePageState();
}

class _SettleHomePageState extends State<SettleHomePage> {
  
  // Called when 'Create a Settle' button is pressed
  void _createASettlePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NameScreen(true, context)),
    );
  }

  // Called when 'Join a Settle' button is pressed
  void _joinASettlePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NameScreen(false, context)),
    );
  }

  // Called when the information button is pressed
  void _informationPressed() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModalDrawerHandle(
                  handleColor: Colors.black38,
                  handleWidth: 35,
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("Settle"),
                subtitle: Text("Version 1.0"),
              ),
              Material(
                child: ListTile(
                  leading: Icon(MdiIcons.github),
                  title: Text("View Source Code on Github"),
                  subtitle: Text("Contribute or open issues"),
                  onTap: () async {
                    const url = "https://github.com/lilbroadam/Settle";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Material(
                child: ListTile(
                  leading: Icon(MdiIcons.email),
                  title: Text("Contact Us"),
                  subtitle: Text("Report bugs, suggestions, or concerns"),
                  onTap: () async {
                    const emailAdrees = "settleitapplication@gmail.com";
                    const subject = "Client Request";
                    const url = 'mailto:$emailAdrees?subject=$subject';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Material(
                child: ListTile(
                    leading: Icon(
                      MdiIcons.currencyUsd,
                      size: 25,
                    ),
                    title: Text("Support Us"),
                    subtitle: Text("Buy us a coffee!"),
                    onTap: () {}),
              )
            ],
          ),
        );
      },
    );
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
    final settleButtonTextStyle = new TextStyle(
      fontSize: 16.4,
      color: Colors.white,
    );

    final animatedText = SizedBox(
      width: 250.0,
      height: 50,
      child: TypewriterAnimatedTextKit(
        pause: Duration(milliseconds: 500),
        speed: Duration(milliseconds: 300),
        onTap: () {
          print("Tap Event");
        },
        text: ["Be everyting...", "Be Settle"],
        textStyle: GoogleFonts.lobster(
            fontSize: 40, textStyle: TextStyle(color: Colors.lightBlue)),
        textAlign: TextAlign.start,
      ),
    );

    final createSettleButton = SizedBox(
      width: settleButtonWidth,
      height: settleButtonHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.blue,
        onPressed: _createASettlePressed,
        child: Text('Create a Settle', style: settleButtonTextStyle),
      ),
    );
    final joinSettleButton = SizedBox(
      width: settleButtonWidth,
      height: settleButtonHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.blue,
        onPressed: _joinASettlePressed,
        child: Text('Join a Settle', style: settleButtonTextStyle),
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 10,
            ),
            animatedText,
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    // Settle buttons in the center
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
                  Align(
                    // Info button in the bottom left
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.info),
                      iconSize: miscButtonSize,
                      tooltip: 'Information about Settle',
                      onPressed: _informationPressed,
                    ),
                  ),
                  Align(
                    // Settings button in the bottom right
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      iconSize: miscButtonSize,
                      tooltip: 'Settle settings',
                      // onPressed: _settingsPressed,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettleCards()),
                        );
                      },
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
