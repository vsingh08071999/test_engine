import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_group_notifier.dart';
import 'package:loginapp/provider/add_group_test_notifier.dart';
import 'package:loginapp/provider/add_question_notifier.dart';
import 'package:loginapp/provider/add_question_test_notifier.dart';
import 'package:loginapp/provider/add_registration_notifier.dart';
import 'package:loginapp/provider/add_student_answer_notifier.dart';
import 'package:loginapp/provider/create_test_notifier.dart';
import 'package:loginapp/provider/getAllQuestionsByTest_notifier.dart';
import 'package:loginapp/provider/getAllTestByStudent_notifier.dart';
import 'package:loginapp/provider/get_question_notifier.dart';
import 'package:loginapp/provider/get_reg_codes_notifier.dart';
import 'package:loginapp/provider/submit_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/loginscreen.dart';
import 'package:loginapp/screens/registration_sceeen.dart';
import 'package:provider/provider.dart';
import './provider/view_group_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserNotifier>(
        create: (context) => UserNotifier(),
      ),
      ChangeNotifierProvider<ViewGroupNotifier>(
        create: (context) => ViewGroupNotifier(),
      ),
      ChangeNotifierProvider<AddGroupNotifier>(
        create: (context) => AddGroupNotifier(),
      ),
      ChangeNotifierProvider<ViewQuestionNotfier>(
        create: (context) => ViewQuestionNotfier(),
      ),
      ChangeNotifierProvider<CreateTestNotifier>(
        create: (context) => CreateTestNotifier(),
      ),
      ChangeNotifierProvider<AddQuestionNotifier>(
        create: (context) => AddQuestionNotifier(),
      ),
      ChangeNotifierProvider<TeacherNotifier>(
        create: (context) => TeacherNotifier(),
      ),
      ChangeNotifierProvider<RegistrationNotifier>(
        create: (context) => RegistrationNotifier(),
      ),
      ChangeNotifierProvider<AddQuestionToTestNotifier>(
        create: (context) => AddQuestionToTestNotifier(),
      ),
      ChangeNotifierProvider<AddGroupTestNotifier>(
        create: (context) => AddGroupTestNotifier(),
      ),
      ChangeNotifierProvider<GetRegCodesNotifier>(
        create: (context) => GetRegCodesNotifier(),
      ),
      ChangeNotifierProvider<GetAllTestByStudentNotifier>(
        create: (context) => GetAllTestByStudentNotifier(),
      ),
      ChangeNotifierProvider<GetAllQuestionsByTestNotifier>(
        create: (context) => GetAllQuestionsByTestNotifier(),
      ),
      ChangeNotifierProvider<GetQuestionNotifier>(
        create: (context) => GetQuestionNotifier(),
      ),
      ChangeNotifierProvider<AddStudentAnswertNotifier>(
        create: (context) => AddStudentAnswertNotifier(),
      ),
      ChangeNotifierProvider<SubmitTestNotifier>(
        create: (context) => SubmitTestNotifier(),
      ),
    ],
    child: MaterialApp(
      //home: RegistrationScreen(),
      home: LoginDemo(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
