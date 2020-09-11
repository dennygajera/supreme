import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:login/screens/pickroom.dart';
import 'package:login/widgets/pagebackground.dart';

class FingerPrintScreen extends StatefulWidget {
  @override
  _FingerPrintScreenState createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double diviceSize = 470;
  bool _load = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  String _authorizedOrNot = "Not Authorized";
  bool _hasFingerPrintSupport = false;
  List<BiometricType> _availableBuimetricType = List<BiometricType>();

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType =
          await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate User", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
    });
    if (authenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PickRoom(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // _getBiometricsSupport();
    // _getAvailableSupport();
    // _authenticateMe();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black54,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          PageBackground(
              size: size, imagePath: 'assets/icons/loginbackground.png'),
          _load
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: RaisedButton(
                    onPressed: () => _authenticateMe(),
                    // child: Text("Authenticat with Fingerprint"),
                  ),
                ),
        ],
      ),
    );
  }
}
