import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class permissionHandling extends ChangeNotifier {
  permissionHandling.init(BuildContext context) {
    checkPermission(context);
  }

  Map<Permission, PermissionStatus>? statuses;

  Future<void> checkPermission(BuildContext context) async {
    var serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    var serviceStatus1 = await Permission.storage.status;
    var serviceStatus2 = await Permission.camera.status;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    var sts = ServiceStatus.enabled;
    print("location Permission : ${serviceStatus}");
    print(" Storage Permission : ${serviceStatus1}");
    print("Camera Permission : ${serviceStatus2}");

    if (serviceStatus == ServiceStatus.enabled ||
        serviceStatus1 == PermissionStatus.denied ||
        serviceStatus2 == PermissionStatus.denied) {
      statuses = await [
        Permission.location,
        Permission.storage,
        Permission.camera,
      ].request();
      print(statuses![Permission.location]);
      print(statuses![Permission.storage]);
      print(statuses![Permission.camera]);
    }

    /// This Condition SatisFied that  Both Condition Are SatisFied
    if (statuses![Permission.location] == PermissionStatus.granted &&
        statuses![Permission.storage] == PermissionStatus.granted &&
        statuses![Permission.camera] == PermissionStatus.granted) {
      print('already granted');
    } else if (statuses![Permission.location] == PermissionStatus.denied ||
        statuses![Permission.storage] == PermissionStatus.denied ||
        statuses![Permission.camera] == PermissionStatus.denied) {
      _showMyDialog(context);

      /// Call This DialogBox
    } else if (statuses![Permission.location] ==
            PermissionStatus.permanentlyDenied ||
        statuses![Permission.storage] == PermissionStatus.permanentlyDenied ||
        statuses![Permission.camera] == PermissionStatus.permanentlyDenied) {
      await openAppSettings();

      /// Call This Method And Set The Permissions
    }
    notifyListeners();
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'Some features might not work correctly without required permission.Please allow for better experience',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: Text('Allow'),
                  onPressed: () async {
                    statuses = await [
                      Permission.location,
                      Permission.storage,
                      Permission.camera,
                    ].request();
                    print(statuses![Permission.location]);
                    print(statuses![Permission.storage]);
                    print(statuses![Permission.camera]);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () async {
                    await openAppSettings();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
    notifyListeners();
  }
}
