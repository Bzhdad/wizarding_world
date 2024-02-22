import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlowersRecord extends FirestoreRecord {
  FlowersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "flower_name" field.
  String? _flowerName;
  String get flowerName => _flowerName ?? '';
  bool hasFlowerName() => _flowerName != null;

  void _initializeFields() {
    _icon = snapshotData['icon'] as String?;
    _description = snapshotData['description'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _flowerName = snapshotData['flower_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flowers');

  static Stream<FlowersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlowersRecord.fromSnapshot(s));

  static Future<FlowersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlowersRecord.fromSnapshot(s));

  static FlowersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlowersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlowersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlowersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlowersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlowersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlowersRecordData({
  String? icon,
  String? description,
  int? id,
  String? flowerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icon': icon,
      'description': description,
      'id': id,
      'flower_name': flowerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlowersRecordDocumentEquality implements Equality<FlowersRecord> {
  const FlowersRecordDocumentEquality();

  @override
  bool equals(FlowersRecord? e1, FlowersRecord? e2) {
    return e1?.icon == e2?.icon &&
        e1?.description == e2?.description &&
        e1?.id == e2?.id &&
        e1?.flowerName == e2?.flowerName;
  }

  @override
  int hash(FlowersRecord? e) => const ListEquality()
      .hash([e?.icon, e?.description, e?.id, e?.flowerName]);

  @override
  bool isValidKey(Object? o) => o is FlowersRecord;
}
