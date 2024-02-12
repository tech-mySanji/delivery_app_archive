// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestDocumentStruct extends FFFirebaseStruct {
  TestDocumentStruct({
    String? asa,
    String? assss,
    String? sss,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _asa = asa,
        _assss = assss,
        _sss = sss,
        super(firestoreUtilData);

  // "asa" field.
  String? _asa;
  String get asa => _asa ?? '';
  set asa(String? val) => _asa = val;
  bool hasAsa() => _asa != null;

  // "assss" field.
  String? _assss;
  String get assss => _assss ?? '';
  set assss(String? val) => _assss = val;
  bool hasAssss() => _assss != null;

  // "sss" field.
  String? _sss;
  String get sss => _sss ?? '';
  set sss(String? val) => _sss = val;
  bool hasSss() => _sss != null;

  static TestDocumentStruct fromMap(Map<String, dynamic> data) =>
      TestDocumentStruct(
        asa: data['asa'] as String?,
        assss: data['assss'] as String?,
        sss: data['sss'] as String?,
      );

  static TestDocumentStruct? maybeFromMap(dynamic data) => data is Map
      ? TestDocumentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'asa': _asa,
        'assss': _assss,
        'sss': _sss,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'asa': serializeParam(
          _asa,
          ParamType.String,
        ),
        'assss': serializeParam(
          _assss,
          ParamType.String,
        ),
        'sss': serializeParam(
          _sss,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestDocumentStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestDocumentStruct(
        asa: deserializeParam(
          data['asa'],
          ParamType.String,
          false,
        ),
        assss: deserializeParam(
          data['assss'],
          ParamType.String,
          false,
        ),
        sss: deserializeParam(
          data['sss'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestDocumentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestDocumentStruct &&
        asa == other.asa &&
        assss == other.assss &&
        sss == other.sss;
  }

  @override
  int get hashCode => const ListEquality().hash([asa, assss, sss]);
}

TestDocumentStruct createTestDocumentStruct({
  String? asa,
  String? assss,
  String? sss,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestDocumentStruct(
      asa: asa,
      assss: assss,
      sss: sss,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestDocumentStruct? updateTestDocumentStruct(
  TestDocumentStruct? testDocument, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testDocument
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestDocumentStructData(
  Map<String, dynamic> firestoreData,
  TestDocumentStruct? testDocument,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testDocument == null) {
    return;
  }
  if (testDocument.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && testDocument.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testDocumentData =
      getTestDocumentFirestoreData(testDocument, forFieldValue);
  final nestedData =
      testDocumentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = testDocument.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestDocumentFirestoreData(
  TestDocumentStruct? testDocument, [
  bool forFieldValue = false,
]) {
  if (testDocument == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testDocument.toMap());

  // Add any Firestore field values
  testDocument.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestDocumentListFirestoreData(
  List<TestDocumentStruct>? testDocuments,
) =>
    testDocuments?.map((e) => getTestDocumentFirestoreData(e, true)).toList() ??
    [];
