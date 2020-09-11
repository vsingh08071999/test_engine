import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/screens/Student_dashboard_screen.dart';
import 'package:loginapp/screens/registration_sceeen.dart';
import 'package:loginapp/widgets/login_textfield.dart';
import 'package:provider/provider.dart';
import 'teachers_dashboard.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

Map<int, Color> color = {};
MaterialColor circleCustom = MaterialColor(0xFF1d499c, color);
MaterialColor backCustom = MaterialColor(0xFF9bcaf4, color);
MaterialColor buttonCustom = MaterialColor(0xFF2d228d, color);
MaterialColor facebookCustom = MaterialColor(0xFF1d499c, color);
MaterialColor googleCustom = MaterialColor(0xFFe25141, color);

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _alertDialog() {
    return showDialog(
        builder: (context) {
          return AlertDialog(
              actionsOverflowDirection: VerticalDirection.up,
              title: Text('LOGIN'),
              content: Consumer<TeacherNotifier>(
                builder: (context, teacherNotifier, _) {
                  switch (teacherNotifier.state) {
                    case TeacherStatusNotifier.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case TeacherStatusNotifier.loaded:
                      return Text(teacherNotifier.user.message);
                    default:
                      return Center(
                        child: Text(teacherNotifier.error),
                      );
                  }
                },
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () async {
                      var role =
                          Provider.of<TeacherNotifier>(context, listen: false)
                              .user
                              .roleName;
                      print(role);
                      if (role == "Student") {
                        print("role is : $role");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentDashboard()));
                      } else
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeacherDashBoard()));
                    },
                    child: Text('Ok'))
              ]);
        },
        context: context);
  }

  _getDataFromServer() {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    teacherNotifier.postTeacher();
    print('Data has been fetched');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: size.width * 1,
              height: size.height * 1,
              child: Image.asset(
                "images/bgImage.jpg",
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 80, bottom: 20),
                        child: Image.asset(
                          "images/signInLogo.png",
                          fit: BoxFit.fill,
                          height: 130,
                          width: 280,
                        ),
                      ),
                      Text('Sign In',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 20,
                      ),
                      loginTextSection(),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _alertDialog();
                                _getDataFromServer();
                              }
                            },
                            splashColor: Colors.white10,
                            child: Container(
                              height: 55,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            color: Colors.blue,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              "Don't have an account",
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
