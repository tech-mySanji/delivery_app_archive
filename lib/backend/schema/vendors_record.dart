import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendorsRecord extends FirestoreRecord {
  VendorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "vendor_name" field.
  String? _vendorName;
  String get vendorName => _vendorName ?? '';
  bool hasVendorName() => _vendorName != null;

  // "shop_name" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "vendor_edit_purchase_price" field.
  bool? _vendorEditPurchasePrice;
  bool get vendorEditPurchasePrice => _vendorEditPurchasePrice ?? false;
  bool hasVendorEditPurchasePrice() => _vendorEditPurchasePrice != null;

  // "vendor_edit_purchase_quantity" field.
  bool? _vendorEditPurchaseQuantity;
  bool get vendorEditPurchaseQuantity => _vendorEditPurchaseQuantity ?? false;
  bool hasVendorEditPurchaseQuantity() => _vendorEditPurchaseQuantity != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _address = snapshotData['address'] as String?;
    _uid = snapshotData['uid'] as String?;
    _vendorName = snapshotData['vendor_name'] as String?;
    _shopName = snapshotData['shop_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _vendorEditPurchasePrice =
        snapshotData['vendor_edit_purchase_price'] as bool?;
    _vendorEditPurchaseQuantity =
        snapshotData['vendor_edit_purchase_quantity'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vendors')
          : FirebaseFirestore.instance.collectionGroup('vendors');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vendors').doc(id);

  static Stream<VendorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VendorsRecord.fromSnapshot(s));

  static Future<VendorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VendorsRecord.fromSnapshot(s));

  static VendorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VendorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VendorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VendorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VendorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VendorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVendorsRecordData({
  String? email,
  String? address,
  String? uid,
  String? vendorName,
  String? shopName,
  String? phoneNumber,
  bool? vendorEditPurchasePrice,
  bool? vendorEditPurchaseQuantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'address': address,
      'uid': uid,
      'vendor_name': vendorName,
      'shop_name': shopName,
      'phone_number': phoneNumber,
      'vendor_edit_purchase_price': vendorEditPurchasePrice,
      'vendor_edit_purchase_quantity': vendorEditPurchaseQuantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class VendorsRecordDocumentEquality implements Equality<VendorsRecord> {
  const VendorsRecordDocumentEquality();

  @override
  bool equals(VendorsRecord? e1, VendorsRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.address == e2?.address &&
        e1?.uid == e2?.uid &&
        e1?.vendorName == e2?.vendorName &&
        e1?.shopName == e2?.shopName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.vendorEditPurchasePrice == e2?.vendorEditPurchasePrice &&
        e1?.vendorEditPurchaseQuantity == e2?.vendorEditPurchaseQuantity;
  }

  @override
  int hash(VendorsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.address,
        e?.uid,
        e?.vendorName,
        e?.shopName,
        e?.phoneNumber,
        e?.vendorEditPurchasePrice,
        e?.vendorEditPurchaseQuantity
      ]);

  @override
  bool isValidKey(Object? o) => o is VendorsRecord;
}
