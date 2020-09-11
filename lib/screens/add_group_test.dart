import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_group_test_notifier.dart';
import 'package:loginapp/provider/view_group_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:provider/provider.dart';

class AddGroupTest extends StatefulWidget {
  @override
  _AddGroupTestState createState() => _AddGroupTestState();
}

class _AddGroupTestState extends State<AddGroupTest> {
  String selectedValue;
  var groupId;
  List qId = [];
  addGroupId() {
    qId.add(groupId);
  }

  var testId;
  _postDataToServer() {
    Provider.of<AddGroupTestNotifier>(context, listen: false)
        .addGroupTestNotifier(testId, qId);
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Text('Add Group To Test',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            content: Consumer<AddGroupTestNotifier>(
              builder: (context, addGroupTestNotifier, _) {
                switch (addGroupTestNotifier.state) {
                  case AddGroupToTestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case AddGroupToTestStatus.loaded:
                    return Text(
                      addGroupTestNotifier.addGroupTestModel.message,
                      style: TextStyle(fontSize: 15),
                    );
                  default:
                    return Center(
                      child: Text(addGroupTestNotifier.error),
                    );
                }
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => TeacherDashBoard()));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'AddGroupsToTest',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            backgroundColor: Colors.black.withOpacity(0.65),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                height: _size.height * 1,
                width: _size.width * 1,
                color: Colors.black.withOpacity(0.8),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      //color: Colors.red.withOpacity(0.5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Consumer<UserNotifier>(
                        builder: (context, userNotifier, _) {
                          return DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                dropdownColor: Colors.black,
                                elevation: 5,
                                hint: Text(
                                  'Tests',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                    print(selectedValue);
                                  });
                                },
                                items: userNotifier.testModel.tests
                                    .map((var singleItem) => DropdownMenuItem(
                                          child: InkWell(
                                            onTap: () {
                                              testId = singleItem.id;
                                              print(testId);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(top: 7),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.68,
                                              // color: Colors.grey,
                                              child: Text(
                                                singleItem.name,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          value: singleItem.name.toString(),
                                        ))
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      // color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        //height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.only(top: 8),
                        child: Consumer<ViewGroupNotifier>(
                          builder: (context, viewGroupNotifier, _) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.white.withOpacity(0.2),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  elevation: 3,
                                  child: InkWell(
                                    onTap: () {
                                      groupId = viewGroupNotifier
                                          .groupModel.groups[index].gid;
                                      addGroupId();
                                      print(qId);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Q : ",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                          Expanded(
                                            child: Text(
                                              viewGroupNotifier.groupModel
                                                  .groups[index].name,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              shrinkWrap: true,
                              itemCount:
                                  viewGroupNotifier.groupModel.groups.length,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            _postDataToServer();
                            _alertDialog(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          splashColor: Colors.grey[200],
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Add Question',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
