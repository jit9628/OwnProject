import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/helper/sharedpreferencesdata/class%20CacheData.dart';
import 'package:p/model/LogOutModel.dart';
import 'package:p/service/ApiService.dart';
import 'package:p/service/repository/data_repository.dart';
import 'package:p/service/repository/data_repository_implementation.dart';
import 'package:p/utils/Url.dart';
import 'package:p/view/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutProvider extends ChangeNotifier {
  DataRepository dataRepository = DataRepositoryImplementation();

  Future<void> userLogOut(BuildContext context) async {
    LogOutModelResponse logOutModelResponse = await dataRepository.userLogOut(
        companyCode: "ATC1", userid: "E1002", context: context);

    if (logOutModelResponse.status == "1") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => LogIn()),
          // ModalRoute.withName('/')
          (route) => false);
    } else if (logOutModelResponse.status == "0") {
    } else {
      print("failled");
    }
  }
}
