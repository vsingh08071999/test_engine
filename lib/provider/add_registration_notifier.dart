import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/registration_model.dart';
import 'package:loginapp/services/add_registration_server.dart';
import 'package:loginapp/widgets/registration_textField.dart';

enum RegistrationStatus { initial, loading, loaded, error }

class RegistrationNotifier extends ChangeNotifier {
  AddRegistrationServer _addRegistrationServer = new AddRegistrationServer();
  RegistraionModel _registraionModel;
  RegistraionModel get registrationModel => _registraionModel;
  String _error;
  String get error => _error;
  RegistrationStatus _state = RegistrationStatus.initial;
  RegistrationStatus get state => _state;
  void _setState(RegistrationStatus state) // it  is normal function
  {
    _state = state;
    notifyListeners();
  }

//  RegistrationNotifier() {
//    postRegistration();
//  }
  Future<void> postRegistration() async {
    try {
      _setState(RegistrationStatus.loading);
      _registraionModel = await _addRegistrationServer.getRegistration(
        userid.text,
        password.text,
        name.text,
        address.text,
        phoneNo.text,
        email.text,
        selectedValue,
        regCode.text,
      );
      _setState(RegistrationStatus.loaded);
    } catch (e) {
      _error = e.toString();
      _setState(RegistrationStatus.error);
    }
    notifyListeners();
  }
}
