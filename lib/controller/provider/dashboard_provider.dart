import 'package:flutter/cupertino.dart';
import 'package:p/model/menu_model.dart';
import 'package:p/service/repository/data_repository.dart';
import 'package:p/service/repository/data_repository_implementation.dart';

class DashBoardProvider extends ChangeNotifier {
  DataRepository repository = DataRepositoryImplementation();
  MenuModalResponse menuModalResponse = MenuModalResponse();

  DashBoardProvider.init(BuildContext context) {
    getMenu(context);
  }

  Future<void> getMenu(BuildContext context) async {
    menuModalResponse = await repository.getMenu(
        companyCode: "ATC1", Employeeid: "E1002", context: context);
    print(menuModalResponse);
    notifyListeners();
  }
}
