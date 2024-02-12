import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _branchRef = prefs.getString('ff_branchRef')?.ref ?? _branchRef;
    });
    _safeInit(() {
      _tempVendorId = prefs.getString('ff_tempVendorId') ?? _tempVendorId;
    });
    _safeInit(() {
      _tempVendorName = prefs.getString('ff_tempVendorName') ?? _tempVendorName;
    });
    _safeInit(() {
      _testLocations = prefs
              .getStringList('ff_testLocations')
              ?.map(latLngFromString)
              .withoutNulls ??
          _testLocations;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _branchRef = FirebaseFirestore.instance.doc('/root/coc01');
  DocumentReference? get branchRef => _branchRef;
  set branchRef(DocumentReference? _value) {
    _branchRef = _value;
    _value != null
        ? prefs.setString('ff_branchRef', _value.path)
        : prefs.remove('ff_branchRef');
  }

  DateTime? _tempDateTime;
  DateTime? get tempDateTime => _tempDateTime;
  set tempDateTime(DateTime? _value) {
    _tempDateTime = _value;
  }

  String _tempVendorId = '';
  String get tempVendorId => _tempVendorId;
  set tempVendorId(String _value) {
    _tempVendorId = _value;
    prefs.setString('ff_tempVendorId', _value);
  }

  String _tempVendorName = '';
  String get tempVendorName => _tempVendorName;
  set tempVendorName(String _value) {
    _tempVendorName = _value;
    prefs.setString('ff_tempVendorName', _value);
  }

  List<LatLng> _testLocations = [
    LatLng(10.0728163, 75.9766297),
    LatLng(10.0740839, 76.2509875)
  ];
  List<LatLng> get testLocations => _testLocations;
  set testLocations(List<LatLng> _value) {
    _testLocations = _value;
    prefs.setStringList(
        'ff_testLocations', _value.map((x) => x.serialize()).toList());
  }

  void addToTestLocations(LatLng _value) {
    _testLocations.add(_value);
    prefs.setStringList(
        'ff_testLocations', _testLocations.map((x) => x.serialize()).toList());
  }

  void removeFromTestLocations(LatLng _value) {
    _testLocations.remove(_value);
    prefs.setStringList(
        'ff_testLocations', _testLocations.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTestLocations(int _index) {
    _testLocations.removeAt(_index);
    prefs.setStringList(
        'ff_testLocations', _testLocations.map((x) => x.serialize()).toList());
  }

  void updateTestLocationsAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _testLocations[_index] = updateFn(_testLocations[_index]);
    prefs.setStringList(
        'ff_testLocations', _testLocations.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTestLocations(int _index, LatLng _value) {
    _testLocations.insert(_index, _value);
    prefs.setStringList(
        'ff_testLocations', _testLocations.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
