import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "shop_name" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "invoice_number" field.
  String? _invoiceNumber;
  String get invoiceNumber => _invoiceNumber ?? '';
  bool hasInvoiceNumber() => _invoiceNumber != null;

  // "payment_status" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "invoice_url" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  bool hasInvoiceUrl() => _invoiceUrl != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "branch_id" field.
  String? _branchId;
  String get branchId => _branchId ?? '';
  bool hasBranchId() => _branchId != null;

  // "no_of_package" field.
  int? _noOfPackage;
  int get noOfPackage => _noOfPackage ?? 0;
  bool hasNoOfPackage() => _noOfPackage != null;

  // "no_of_done_package" field.
  int? _noOfDonePackage;
  int get noOfDonePackage => _noOfDonePackage ?? 0;
  bool hasNoOfDonePackage() => _noOfDonePackage != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ordered_time" field.
  DateTime? _orderedTime;
  DateTime? get orderedTime => _orderedTime;
  bool hasOrderedTime() => _orderedTime != null;

  // "packages" field.
  List<CartItemStruct>? _packages;
  List<CartItemStruct> get packages => _packages ?? const [];
  bool hasPackages() => _packages != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _customerName = snapshotData['customer_name'] as String?;
    _shopName = snapshotData['shop_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _invoiceNumber = snapshotData['invoice_number'] as String?;
    _paymentStatus = snapshotData['payment_status'] as String?;
    _invoiceUrl = snapshotData['invoice_url'] as String?;
    _address = snapshotData['address'] as String?;
    _orderId = snapshotData['order_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _branchId = snapshotData['branch_id'] as String?;
    _noOfPackage = castToType<int>(snapshotData['no_of_package']);
    _noOfDonePackage = castToType<int>(snapshotData['no_of_done_package']);
    _location = snapshotData['location'] as LatLng?;
    _orderedTime = snapshotData['ordered_time'] as DateTime?;
    _packages = getStructList(
      snapshotData['packages'],
      CartItemStruct.fromMap,
    );
    _total = castToType<double>(snapshotData['total']);
    _orderStatus = snapshotData['order_status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('orders').doc(id);

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? customerName,
  String? shopName,
  String? phoneNumber,
  String? invoiceNumber,
  String? paymentStatus,
  String? invoiceUrl,
  String? address,
  String? orderId,
  String? userId,
  String? branchId,
  int? noOfPackage,
  int? noOfDonePackage,
  LatLng? location,
  DateTime? orderedTime,
  double? total,
  String? orderStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_name': customerName,
      'shop_name': shopName,
      'phone_number': phoneNumber,
      'invoice_number': invoiceNumber,
      'payment_status': paymentStatus,
      'invoice_url': invoiceUrl,
      'address': address,
      'order_id': orderId,
      'user_id': userId,
      'branch_id': branchId,
      'no_of_package': noOfPackage,
      'no_of_done_package': noOfDonePackage,
      'location': location,
      'ordered_time': orderedTime,
      'total': total,
      'order_status': orderStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.customerName == e2?.customerName &&
        e1?.shopName == e2?.shopName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.invoiceNumber == e2?.invoiceNumber &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.invoiceUrl == e2?.invoiceUrl &&
        e1?.address == e2?.address &&
        e1?.orderId == e2?.orderId &&
        e1?.userId == e2?.userId &&
        e1?.branchId == e2?.branchId &&
        e1?.noOfPackage == e2?.noOfPackage &&
        e1?.noOfDonePackage == e2?.noOfDonePackage &&
        e1?.location == e2?.location &&
        e1?.orderedTime == e2?.orderedTime &&
        listEquality.equals(e1?.packages, e2?.packages) &&
        e1?.total == e2?.total &&
        e1?.orderStatus == e2?.orderStatus;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.shopName,
        e?.phoneNumber,
        e?.invoiceNumber,
        e?.paymentStatus,
        e?.invoiceUrl,
        e?.address,
        e?.orderId,
        e?.userId,
        e?.branchId,
        e?.noOfPackage,
        e?.noOfDonePackage,
        e?.location,
        e?.orderedTime,
        e?.packages,
        e?.total,
        e?.orderStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
