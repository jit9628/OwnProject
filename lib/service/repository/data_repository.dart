import 'package:flutter/material.dart';
import 'package:p/model/LoginCheck.dart';
import 'package:p/model/trip_unloading.dart';

abstract class DataRepository {
  Future<TripUnloading> getVehicle(
      {required String companyCode,
      required BuildContext context}); //return type model

  Future<LoginCheck> userLogIn(
      {required String companyCode,
      required String userid,
      required String password,
      required BuildContext context});
}
