import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompleteQuestsRecord extends FirestoreRecord {
  CompleteQuestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "quest_name" field.
  String? _questName;
  String get questName => _questName ?? '';
  bool hasQuestName() => _questName != null;

  // "gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  bool hasGold() => _gold != null;

  // "experience" field.
  int? _experience;
  int get experience => _experience ?? 0;
  bool hasExperience() => _experience != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  bool hasCoordinates() => _coordinates != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _description = snapshotData['description'] as String?;
    _questName = snapshotData['quest_name'] as String?;
    _gold = castToType<int>(snapshotData['gold']);
    _experience = castToType<int>(snapshotData['experience']);
    _coordinates = snapshotData['coordinates'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('complete_quests')
          : FirebaseFirestore.instance.collectionGroup('complete_quests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('complete_quests').doc(id);

  static Stream<CompleteQuestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompleteQuestsRecord.fromSnapshot(s));

  static Future<CompleteQuestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompleteQuestsRecord.fromSnapshot(s));

  static CompleteQuestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompleteQuestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompleteQuestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompleteQuestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompleteQuestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompleteQuestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompleteQuestsRecordData({
  int? id,
  String? description,
  String? questName,
  int? gold,
  int? experience,
  LatLng? coordinates,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'description': description,
      'quest_name': questName,
      'gold': gold,
      'experience': experience,
      'coordinates': coordinates,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompleteQuestsRecordDocumentEquality
    implements Equality<CompleteQuestsRecord> {
  const CompleteQuestsRecordDocumentEquality();

  @override
  bool equals(CompleteQuestsRecord? e1, CompleteQuestsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.description == e2?.description &&
        e1?.questName == e2?.questName &&
        e1?.gold == e2?.gold &&
        e1?.experience == e2?.experience &&
        e1?.coordinates == e2?.coordinates;
  }

  @override
  int hash(CompleteQuestsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.description,
        e?.questName,
        e?.gold,
        e?.experience,
        e?.coordinates
      ]);

  @override
  bool isValidKey(Object? o) => o is CompleteQuestsRecord;
}
