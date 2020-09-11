import 'package:flutter/material.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:provider/provider.dart';

class ViewTest extends StatefulWidget {
  @override
  _ViewTestState createState() => _ViewTestState();
}

class _ViewTestState extends State<ViewTest> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.65),
          elevation: 5,
          title: Text(
            'View Test',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: _size.height * 1,
              width: _size.width * 1,
              color: Colors.black.withOpacity(0.8),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Consumer<UserNotifier>(
                  builder: (context, userNotifier, _) {
                    switch (userNotifier.state) {
                      case ViewTestStatusNotifier.loading:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case ViewTestStatusNotifier.loaded:
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white.withOpacity(0.2),
                              elevation: 8,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Name : ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            // 'Name :',
                                            '${userNotifier.testModel.tests[index].name}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Description : ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            // 'Name :',
                                            '${userNotifier.testModel.tests[index].descr}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Duration : ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            // 'Name :',
                                            '${userNotifier.testModel.tests[index].duration}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Passing Score : ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            // 'Name :',
                                            '${userNotifier.testModel.tests[index].passingScore}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: userNotifier.testModel.tests.length,
                        );
                      default:
                        return Center(
                          child: Text(userNotifier.error),
                        );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
