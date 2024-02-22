import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkersRecord extends FirestoreRecord {
  MarkersRecord._(
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

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "markerType" field.
  MarkerType? _markerType;
  MarkerType? get markerType => _markerType;
  bool hasMarkerType() => _markerType != null;

  // "nextQuest" field.
  DocumentReference? _nextQuest;
  DocumentReference? get nextQuest => _nextQuest;
  bool hasNextQuest() => _nextQuest != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _coordinate = snapshotData['coordinate'] as LatLng?;
    _gold = castToType<int>(snapshotData['gold']);
    _experience = castToType<int>(snapshotData['experience']);
    _icon = snapshotData['icon'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _completeDescription = snapshotData['complete_description'] as String?;
    _dialog = getStructList(
      snapshotData['dialog'],
      DialogStruct.fromMap,
    );
    _count = castToType<int>(snapshotData['count']);
    _uid = snapshotData['uid'] as String?;
    _markerType = deserializeEnum<MarkerType>(snapshotData['markerType']);
    _nextQuest = snapshotData['nextQuest'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('markers')
          : FirebaseFirestore.instance.collectionGroup('markers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('markers').doc(id);

  static Stream<MarkersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarkersRecord.fromSnapshot(s));

  static Future<MarkersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarkersRecord.fromSnapshot(s));

  static MarkersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarkersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarkersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarkersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarkersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarkersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarkersRecordData({
  int? id,
  DateTime? creationDate,
  LatLng? coordinate,
  int? gold,
  int? experience,
  String? icon,
  String? name,
  String? description,
  String? completeDescription,
  int? count,
  String? uid,
  MarkerType? markerType,
  DocumentReference? nextQuest,
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
      'description': description,
      'complete_description': completeDescription,
      'count': count,
      'uid': uid,
      'markerType': markerType,
      'nextQuest': nextQuest,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarkersRecordDocumentEquality implements Equality<MarkersRecord> {
  const MarkersRecordDocumentEquality();

  @override
  bool equals(MarkersRecord? e1, MarkersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.creationDate == e2?.creationDate &&
        e1?.coordinate == e2?.coordinate &&
        e1?.gold == e2?.gold &&
        e1?.experience == e2?.experience &&
        e1?.icon == e2?.icon &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.completeDescription == e2?.completeDescription &&
        listEquality.equals(e1?.dialog, e2?.dialog) &&
        e1?.count == e2?.count &&
        e1?.uid == e2?.uid &&
        e1?.markerType == e2?.markerType &&
        e1?.nextQuest == e2?.nextQuest;
  }

  @override
  int hash(MarkersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.creationDate,
        e?.coordinate,
        e?.gold,
        e?.experience,
        e?.icon,
        e?.name,
        e?.description,
        e?.completeDescription,
        e?.dialog,
        e?.count,
        e?.uid,
        e?.markerType,
        e?.nextQuest
      ]);

  @override
  bool isValidKey(Object? o) => o is MarkersRecord;
}
