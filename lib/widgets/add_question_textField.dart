import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TextEditingController uidCon = TextEditingController();
TextEditingController nameCon = TextEditingController();
TextEditingController scoreCon = TextEditingController();
TextEditingController n1 = TextEditingController();
TextEditingController n2 = TextEditingController();
TextEditingController n3 = TextEditingController();
TextEditingController n4 = TextEditingController();
TextEditingController d1 = TextEditingController();
TextEditingController d2 = TextEditingController();
TextEditingController d3 = TextEditingController();
TextEditingController d4 = TextEditingController();
TextEditingController a1 = TextEditingController();
TextEditingController a2 = TextEditingController();
TextEditingController a3 = TextEditingController();
TextEditingController a4 = TextEditingController();
Container addQuestionTextSection1(context) {
  return Container(
      child: Column(
    children: <Widget>[
      //   text('Uid', context, uidCon),
      questionText('Question name', context, nameCon),
      scoreText('Score', context, scoreCon),
    ],
  ));
}

Container addQuestionTextSection2(context) {
  return Container(
    child: Column(
      children: <Widget>[
        answerContainer(context, n1, d1, a1),
        answerContainer(context, n2, d2, a2),
        answerContainer(context, n3, d3, a3),
        answerContainer(context, n4, d4, a4),
      ],
    ),
  );
}

Widget questionText(name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "This field can't be empty";
        } else
          return null;
      },
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      decoration: InputDecoration(
          labelText: name,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          // hintText: name,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
    ),
  );
}

Widget scoreText(name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "This field can't be empty";
        } else
          return null;
      },
      keyboardType: TextInputType.number,
      onTap: () {},
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      decoration: InputDecoration(
          labelText: name,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 1.7)),
          //  hintText: name,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)),
    ),
  );
}

Widget answerContainer(context, controller1, controller2, controller3) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          //margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.20,
          child: TextFormField(
            controller: controller1,
            textAlign: TextAlign.left,
            validator: (value) {
              if (value.isEmpty) {
                return "This field can't be empty";
              } else
                return null;
            },
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
            decoration: InputDecoration(
                labelText: 'option',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                filled: true,
                fillColor: Colors.black.withOpacity(0.3),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                //    hintText: "option",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: MediaQuery.of(context).size.width * 0.55,
          child: TextFormField(
            controller: controller2,
            textAlign: TextAlign.left,
            validator: (value) {
              if (value.isEmpty) {
                return "This field can't be empty";
              } else
                return null;
            },
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
            decoration: InputDecoration(
                labelText: 'description',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                filled: true,
                fillColor: Colors.black.withOpacity(0.3),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                //  hintText: "description",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
          ),
        ),
        Container(
          //margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.18,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "This field can't be empty";
              } else
                return null;
            },
            controller: controller3,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
            decoration: InputDecoration(
                labelText: 'Y/N',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                filled: true,
                fillColor: Colors.black.withOpacity(0.3),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.7)),
                //hintText: "Y/N",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
          ),
        ),
      ],
    ),
  );
}
