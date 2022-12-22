import 'package:flutter/material.dart';

import 'package:p/service/ApiService.dart';
import 'package:p/service/data_source.dart';
import 'package:p/utils/Url.dart';
import 'package:provider/provider.dart';

class DataImplementation extends DataSource {
  @override
  Future<dynamic> getVehicle(
      {required String companyCode, required BuildContext context}) async {
    dynamic data = {"companyCode": companyCode};
    return await Provider.of<ApiServices>(context, listen: false)
        .CallPostApi(data, URLs.getLSno);
  }

  @override
  Future userLogIn(
      {required String companyCode,
      required String userid,
      required String password,
      required BuildContext context}) {
    throw UnimplementedError();
  }
}
