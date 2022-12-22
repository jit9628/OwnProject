import 'package:flutter/material.dart';
import 'package:p/model/LoginCheck.dart';
import 'package:p/model/trip_unloading.dart';
import 'package:p/repository/data_repository.dart';
import 'package:p/service/data_implementation.dart';
import 'package:p/service/data_source.dart';

class DataRepositoryImplementation extends DataRepository {
  DataSource dataSource = DataImplementation();

  @override
  Future<TripUnloading> getVehicle(
      {required String companyCode, required BuildContext context}) async {
    var response =
    await dataSource.getVehicle(companyCode: companyCode, context: context);
    final tripUnloading = TripUnloading.fromJson(response);
    print(tripUnloading.data);
    return tripUnloading;
  }

  @override
  Future<LoginCheck> userLogIn({required String companyCode,
    required String userid,
    required String password,
    required BuildContext context}) {
    throw UnimplementedError();
  } //return type model

}
