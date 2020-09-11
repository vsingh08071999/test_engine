import 'package:flutter/material.dart';
import 'package:loginapp/models/group_view_model.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/provider/view_group_notifier.dart';
import 'package:loginapp/screens/get_reg_codes.dart';
import 'package:provider/provider.dart';

class ViewGroup extends StatefulWidget {
  @override
  _ViewGroupState createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
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
            'View Group',
            //user.rights[23].createGroup,
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
              child: Consumer<ViewGroupNotifier>(
                builder: (context, viewGroupNotifier, _) {
                  switch (viewGroupNotifier.state) {
                    case ViewgroupStatusNotifier.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ViewgroupStatusNotifier.loaded:
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 8,
                            color: Colors.white.withOpacity(0.2),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                int gid = viewGroupNotifier
                                    .groupModel.groups[index].gid;
                                print("GroupId is : $gid");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GetRegCode(gid: gid)));
                              },
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
                                            // 'asfdsfdsfdf',
                                            '${viewGroupNotifier.groupModel.groups[index].name}',
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
                                            // 'sddxfcgvhbncvb',
                                            '${viewGroupNotifier.groupModel.groups[index].descr}',
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
                                            'Gid : ',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${viewGroupNotifier.groupModel.groups[index].gid}',
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
                            ),
                          );
                        },
                        // itemCount: 4,
                        itemCount: viewGroupNotifier.groupModel.groups.length,
                      );
                    default:
                      return Center(
                        child: Text(viewGroupNotifier.error),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
