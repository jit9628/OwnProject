import 'package:flutter/cupertino.dart';
import 'package:p/model/menu_model.dart';
import 'package:p/model/trip_unloading.dart';
import 'package:p/service/repository/data_repository.dart';
import 'package:p/service/repository/data_repository_implementation.dart';

class TripUnloadingProvider extends ChangeNotifier {
  Future<Type> getVechiles(BuildContext context) async {
    DataRepository repositories = DataRepositoryImplementation();
    TripUnloading unloadingTrip =
        await repositories.getVehicle(companyCode: "ATC1", context: context);
    if (unloadingTrip.status == "0") {
      return TripUnloading;
    } else {
      notifyListeners();
      return TripUnloading;
    }
  }

// Future<Object> getMenu(BuildContext context) async {
//   DataRepository repositories = DataRepositoryImplementation();
//   MenuModalResponse menuModalResponse = await repositories.getMenu(
//       companyCode: "ATC1", Employeeid: "E1002", context: context);
//   print("success Start ");
//   for (var iteam in menuModalResponse.data!) {
//     print(iteam.employeeid);
//   }
//   print("success end ");
//   if (menuModalResponse.status == "0") {
//     return menuModalResponse;
//   } else {
//     notifyListeners();
//     return menuModalResponse;
//   }
// }
}
