import 'package:advanced_flutter_course/base/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel{

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

}

abstract class LoginViewModelInputs{
  // three functions
  setUserName(String userName);
  setPassword(String userName);
  login();
  // two sinks
  Sink get inputUserName;
  Sink get inputPassword;
}