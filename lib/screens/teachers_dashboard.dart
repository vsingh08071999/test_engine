import 'package:flutter/material.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_group_notifier.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/add_group_test.dart';
import 'package:loginapp/screens/add_questions_to_test.dart';
import 'package:loginapp/screens/create_test.dart';
import 'package:loginapp/screens/view_group.dart';
import 'package:loginapp/screens/view_question.dart';
import 'package:loginapp/screens/view_test.dart';
import 'package:provider/provider.dart';
import 'add_question.dart';
import 'create_group.dart';

class TeacherDashBoard extends StatefulWidget {
  int userId;
  @override
  _TeacherDashBoardState createState() => _TeacherDashBoardState(userId);
}

Map<int, Color> color = {};
MaterialColor mainHeading = MaterialColor(0xFFc6e3eb, color);

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  int userId;
  _TeacherDashBoardState(userId);

  _drawerHeader() {
    return DrawerHeader(
      child: Text(
        'Teacher',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 2)],
        color: Colors.deepOrangeAccent,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    Provider.of<UserNotifier>(context, listen: false).getTest(uid);
    Provider.of<ViewQuestionNotfier>(context, listen: false).getQuestions(uid);
    Provider.of<ViewGroupNotifier>(context, listen: false).getGroup(uid);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
//          appBar: AppBar(
//            backgroundColor: Colors.black.withOpacity(0.7),
//            title: Text('Teacher DashBoard'),
//          ),
//          drawer: Drawer(
//            child: Column(
//              children: <Widget>[
//                Container(
//                    height: MediaQuery.of(context).size.height * 0.15,
//                    width: MediaQuery.of(context).size.width,
//                    child: _drawerHeader()),
//                Expanded(
//                  child: ListView(
//                    children: <Widget>[
//                      ListTile(
//                        title: Text(
//                          'Create Test',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => CreateTest()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'View Test',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => ViewTest()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'Add Question',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => AddQuestion()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'View Question',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => ViewQuestion()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'Create Group',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => CreateGroup()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'View Group',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => ViewGroup()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'AddQuestionsToTest',
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => AddQuestionsToTest()));
//                        },
//                      ),
//                      ListTile(
//                        title: Text(
//                          'AddGroupsToTest',
//                          //teacherNotifier.user.rights[23].createGroup,
//                          style: TextStyle(fontSize: 25),
//                        ),
//                        onTap: () {
//                          // var info = await GetAllGroup.getAllGroup();
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => AddGroupTest()));
//                        },
//                      )
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
          body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 1,
              width: size.width * 1,
              color: Colors.black.withOpacity(0.76),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  Align(
                    child: Text(
                      "Teacher Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.black.withOpacity(0.2),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2017/06/09/23/22/people-2388584_960_720.png'),
                          maxRadius: 50,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Vishal Singh',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'RIET',
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 4,
                              width: 5,
                            ),
                            Text(
                              'B.Tech (Computer Science)',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Create Test',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      //  textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateTest()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'View Test',
                      style: TextStyle(fontSize: 25, color: Colors.white),
//                        textAlign: TextAlign.center
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewTest()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Add Question',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddQuestion()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'View Question',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewQuestion()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Create Group',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGroup()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'View Group',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewGroup()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'AddQuestionsToTest',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddQuestionsToTest()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      'AddGroupsToTest',
                      //teacherNotifier.user.rights[23].createGroup,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () {
                      // var info = await GetAllGroup.getAllGroup();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddGroupTest()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
