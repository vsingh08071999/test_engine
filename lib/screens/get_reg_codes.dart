import 'package:flutter/material.dart';
import 'package:loginapp/provider/get_reg_codes_notifier.dart';
import 'package:provider/provider.dart';

class GetRegCode extends StatefulWidget {
  int gid;
  GetRegCode({this.gid});
  @override
  _GetRegCodeState createState() => _GetRegCodeState();
}

class _GetRegCodeState extends State<GetRegCode> {
  TextEditingController regController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  getDataFromServer() {
    Provider.of<GetRegCodesNotifier>(context, listen: false)
        .postRegCode(widget.gid, regController.text);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.68),
        title: Text(
          'Get Registration Codes',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            height: _size.height * 1,
            width: _size.width * 1,
            color: Colors.black.withOpacity(0.8),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          controller: regController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the value";
                            } else
                              return null;
                          },
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            errorBorder: InputBorder.none,
                            //enabled: true,
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.7)),
                            fillColor: Colors.black.withOpacity(0.3),
                            filled: true,
                            labelText: "type no. of regCode",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                            border: InputBorder.none,
                            //hintText: "type no. of regCode",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.7)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 1.7, color: Colors.white)),
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        width: _size.width * 0.60,
                      ),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            getDataFromServer();
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        splashColor: Colors.grey[200],
                        child: Container(
                          height: 55,
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Generate',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //color: Colors.black.withOpacity(0.65),
                    width: double.infinity,
                    height: _size.height * 0.745,
                    child: Expanded(
                      child: Consumer<GetRegCodesNotifier>(
                        builder: (context, getRegCodesNotifier, _) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              if (index >=
                                  getRegCodesNotifier
                                      .regCodeModel.codes.length) {
                                return CircularProgressIndicator();
                              }
                              return Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.white.withOpacity(0.2),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 8),
                                elevation: 8,
                                child: InkWell(
                                  onTap: () {
                                    var code = getRegCodesNotifier
                                        .regCodeModel.codes[index];
                                    print("RegCode is : $code");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      getRegCodesNotifier
                                          .regCodeModel.codes[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),

//                                margin: EdgeInsets.only(
//                                    left: 8, right: 8, bottom: 15),
                              );
                            },
                            itemCount:
                                getRegCodesNotifier.regCodeModel.codes.length,
                            shrinkWrap: true,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    // width: 250,
//                    width: MediaQuery.of(context).size.width * 0.70,
//                    //height: MediaQuery.of(context).size.height * 0.20,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(8),
//                        ),
//                        border: Border.all(width: 2, color: Colors.black)),
//                    child: TextField(
//                      controller: regController, textAlign: TextAlign.center,
//                      decoration: InputDecoration(
//                          hintText: "Type no. of RegCode you want",
//                          hintStyle: TextStyle(
//                              color: Colors.grey,
//                              fontWeight: FontWeight.w400,
//                              fontSize: 18)),
//                      onTap: () {},
//                      style: TextStyle(fontSize: 23),
//                      // maxLines: _line,
//                    ),
//                  ),
//                  Align(
//                    alignment: Alignment.topRight,
//                    child: RaisedButton(
//                      onPressed: () {
//                        getDataFromServer();
//                      },
//                      child: Text(
//                        'Submit',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                      color: Colors.red,
//                    ),
//                  )
//                ],
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              Expanded(
//                child: Consumer<GetRegCodesNotifier>(
//                  builder: (context, getRegCodesNotifier, _) {
//                    return ListView.builder(
//                      itemBuilder: (context, index) {
//                        if (index >=
//                            getRegCodesNotifier.regCodeModel.codes.length) {
//                          return CircularProgressIndicator();
//                        }
//                        return Card(
//                          child: InkWell(
//                            onTap: () {
//                              var code =
//                                  getRegCodesNotifier.regCodeModel.codes[index];
//                              print("RegCode is : $code");
//                            },
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                getRegCodesNotifier.regCodeModel.codes[index],
//                                style: TextStyle(
//                                    fontWeight: FontWeight.w400, fontSize: 20),
//                              ),
//                            ),
//                          ),
//                          elevation: 3,
//                          margin: EdgeInsets.only(left: 8, right: 8, bottom: 15),
//                        );
//                      },
//                      itemCount: getRegCodesNotifier.regCodeModel.codes.length,
//                      shrinkWrap: true,
//                    );
//                  },
//                ),
//              )
//            ],
//          ),
//        ),
          ),
    );
  }
}
