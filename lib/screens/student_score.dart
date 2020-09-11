import 'package:flutter/material.dart';
import 'package:loginapp/provider/submit_test_notifier.dart';
import 'package:loginapp/screens/Student_dashboard_screen.dart';
import 'package:provider/provider.dart';

class StudentScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 1,
              width: size.width * 1,
              color: Colors.black.withOpacity(0.76),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<SubmitTestNotifier>(
                    builder: (context, submitTest, _) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Your total score is : ${submitTest.submitTestModel.score.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentDashboard()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        splashColor: Colors.grey[200],
                        child: Container(
                          height: 55,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Back to Dashboard',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
