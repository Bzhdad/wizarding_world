import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryRecord extends FirestoreRecord {
  InventoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "coordinate" field.
  LatLng? _coordinate;
  LatLng? get coordinate => _coordinate;
  bool hasCoordinate() => _coordinate != null;

  // "gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  bool hasGold() => _gold != null;

  // "experience" field.
  int? _experience;
  int get experience => _experience ?? 0;
  bool hasExperience() => _experience != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "marker_type" field.
  MarkerType? _markerType;
  MarkerType? get markerType => _markerType;
  bool hasMarkerType() => _markerType != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "complete_description" field.
  String? _completeDescription;
  String get completeDescription => _completeDescription ?? '';
  bool hasCompleteDescription() => _completeDescription != null;

  // "dialog" field.
  List<DialogStruct>? _dialog;
  List<DialogStruct> get dialog => _dialog ?? const [];
  bool hasDialog() => _dialog != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _coordinate = snapshotData['coordinate'] as LatLng?;
    _gold = castToType<int>(snapshotData['gold']);
    _experience = castToType<int>(snapshotData['experience']);
    _icon = snapshotData['icon'] as String?;
    _name = snapshotData['name'] as String?;
    _markerType = deserializeEnum<MarkerType>(snapshotData['marker_type']);
    _description = snapshotData['description'] as String?;
    _completeDescription = snapshotData['complete_description'] as String?;
    _dialog = getStructList(
      snapshotData['dialog'],
      DialogStruct.fromMap,
    );
    _count = castToType<int>(snapshotData['count']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inventory')
          : FirebaseFirestore.instance.collectionGroup('inventory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inventory').doc(id);

  static Stream<InventoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryRecord.fromSnapshot(s));

  static Future<InventoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryRecord.fromSnapshot(s));

  static InventoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryRecordData({
  int? id,
  DateTime? creationDate,
  LatLng? coordinate,
  int? gold,
  int? experience,
  String? icon,
  String? name,
  MarkerType? markerType,
  String? description,
  String? completeDescription,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'creation_date': creationDate,
      'coordinate': coordinate,
      'gold': gold,
      'experience': experience,
      'icon': icon,
      'name': name,
      'marker_type': markerType,
      'description': description,
      'complete_description': completeDescription,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventoryRecordDocumentEquality implements Equality<InventoryRecord> {
  const InventoryRecordDocumentEquality();

  @override
  bool equals(InventoryRecord? e1, InventoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.creationDate == e2?.creationDate &&
        e1?.coordinate == e2?.coordinate &&
        e1?.gold == e2?.gold &&
        e1?.experience == e2?.experience &&
        e1?.icon == e2?.icon &&
        e1?.name == e2?.name &&
        e1?.markerType == e2?.markerType &&
        e1?.description == e2?.description &&
        e1?.completeDescription == e2?.completeDescription &&
        listEquality.equals(e1?.dialog, e2?.dialog) &&
        e1?.count == e2?.count;
  }

  @override
  int hash(InventoryRecord? e) => const ListEquality().hash([
        e?.id,
        e?.creationDate,
        e?.coordinate,
        e?.gold,
        e?.experience,
        e?.icon,
        e?.name,
        e?.markerType,
        e?.description,
        e?.completeDescription,
        e?.dialog,
        e?.count
      ]);

  @override
  bool isValidKey(Object? o) => o is InventoryRecord;
}
