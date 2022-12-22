import 'package:flutter/material.dart';

abstract class DataSource {
  Future<dynamic> getVehicle(
      {required String companyCode, required BuildContext context});

  Future<dynamic> userLogIn(
      {required String companyCode,
      required String userid,
      required String password,
      required BuildContext context});
}
