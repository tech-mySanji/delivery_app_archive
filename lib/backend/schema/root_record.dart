import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RootRecord extends FirestoreRecord {
  RootRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fake" field.
  String? _fake;
  String get fake => _fake ?? '';
  bool hasFake() => _fake != null;

  void _initializeFields() {
    _fake = snapshotData['fake'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('root');

  static Stream<RootRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RootRecord.fromSnapshot(s));

  static Future<RootRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RootRecord.fromSnapshot(s));

  static RootRecord fromSnapshot(DocumentSnapshot snapshot) => RootRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RootRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RootRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RootRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RootRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRootRecordData({
  String? fake,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fake': fake,
    }.withoutNulls,
  );

  return firestoreData;
}

class RootRecordDocumentEquality implements Equality<RootRecord> {
  const RootRecordDocumentEquality();

  @override
  bool equals(RootRecord? e1, RootRecord? e2) {
    return e1?.fake == e2?.fake;
  }

  @override
  int hash(RootRecord? e) => const ListEquality().hash([e?.fake]);

  @override
  bool isValidKey(Object? o) => o is RootRecord;
}
