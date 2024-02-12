import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeilveryAgentsRecord extends FirestoreRecord {
  DeilveryAgentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "delivery_agent_name" field.
  String? _deliveryAgentName;
  String get deliveryAgentName => _deliveryAgentName ?? '';
  bool hasDeliveryAgentName() => _deliveryAgentName != null;

  // "aadhar_number" field.
  String? _aadharNumber;
  String get aadharNumber => _aadharNumber ?? '';
  bool hasAadharNumber() => _aadharNumber != null;

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "id_proof_image" field.
  String? _idProofImage;
  String get idProofImage => _idProofImage ?? '';
  bool hasIdProofImage() => _idProofImage != null;

  // "license_image" field.
  String? _licenseImage;
  String get licenseImage => _licenseImage ?? '';
  bool hasLicenseImage() => _licenseImage != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "cash_balance" field.
  double? _cashBalance;
  double get cashBalance => _cashBalance ?? 0.0;
  bool hasCashBalance() => _cashBalance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _deliveryAgentName = snapshotData['delivery_agent_name'] as String?;
    _aadharNumber = snapshotData['aadhar_number'] as String?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _address = snapshotData['address'] as String?;
    _idProofImage = snapshotData['id_proof_image'] as String?;
    _licenseImage = snapshotData['license_image'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _cashBalance = castToType<double>(snapshotData['cash_balance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('deilvery_agents')
          : FirebaseFirestore.instance.collectionGroup('deilvery_agents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('deilvery_agents').doc(id);

  static Stream<DeilveryAgentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeilveryAgentsRecord.fromSnapshot(s));

  static Future<DeilveryAgentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeilveryAgentsRecord.fromSnapshot(s));

  static DeilveryAgentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeilveryAgentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeilveryAgentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeilveryAgentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeilveryAgentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeilveryAgentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeilveryAgentsRecordData({
  String? deliveryAgentName,
  String? aadharNumber,
  String? licenseNumber,
  String? address,
  String? idProofImage,
  String? licenseImage,
  String? email,
  String? phoneNumber,
  String? uid,
  double? cashBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'delivery_agent_name': deliveryAgentName,
      'aadhar_number': aadharNumber,
      'license_number': licenseNumber,
      'address': address,
      'id_proof_image': idProofImage,
      'license_image': licenseImage,
      'email': email,
      'phone_number': phoneNumber,
      'uid': uid,
      'cash_balance': cashBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeilveryAgentsRecordDocumentEquality
    implements Equality<DeilveryAgentsRecord> {
  const DeilveryAgentsRecordDocumentEquality();

  @override
  bool equals(DeilveryAgentsRecord? e1, DeilveryAgentsRecord? e2) {
    return e1?.deliveryAgentName == e2?.deliveryAgentName &&
        e1?.aadharNumber == e2?.aadharNumber &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.address == e2?.address &&
        e1?.idProofImage == e2?.idProofImage &&
        e1?.licenseImage == e2?.licenseImage &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.cashBalance == e2?.cashBalance;
  }

  @override
  int hash(DeilveryAgentsRecord? e) => const ListEquality().hash([
        e?.deliveryAgentName,
        e?.aadharNumber,
        e?.licenseNumber,
        e?.address,
        e?.idProofImage,
        e?.licenseImage,
        e?.email,
        e?.phoneNumber,
        e?.uid,
        e?.cashBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is DeilveryAgentsRecord;
}
