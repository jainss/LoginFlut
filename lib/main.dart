import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        microseconds: 500,
      ),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     "Log In Page",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: (_iconAnimation.value) * 150,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Form(
                      // ignore: deprecated_member_use
                      autovalidate: true,
                      child: Theme(
                        data: ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.teal,
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                            ))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              decoration:
                                  InputDecoration(labelText: "Enter Email"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(labelText: "Enter Password"),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.0),
                            ),
                            MaterialButton(
                              height: 50.0,
                              minWidth: 120.0,
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: Text('Login '),
                              onPressed: () => {},
                              splashColor: Colors.amberAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            Text(
                              "Not account   Sign up",
                              style: TextStyle(
                                  color: Colors.green.shade100,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Jain SS
