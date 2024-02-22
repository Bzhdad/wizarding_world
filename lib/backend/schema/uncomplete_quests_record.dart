import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UncompleteQuestsRecord extends FirestoreRecord {
  UncompleteQuestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "quest_give_date" field.
  DateTime? _questGiveDate;
  DateTime? get questGiveDate => _questGiveDate;
  bool hasQuestGiveDate() => _questGiveDate != null;

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

  // "quest_name" field.
  String? _questName;
  String get questName => _questName ?? '';
  bool hasQuestName() => _questName != null;

  // "NPC_location_name" field.
  String? _nPCLocationName;
  String get nPCLocationName => _nPCLocationName ?? '';
  bool hasNPCLocationName() => _nPCLocationName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "complete_quest_description" field.
  String? _completeQuestDescription;
  String get completeQuestDescription => _completeQuestDescription ?? '';
  bool hasCompleteQuestDescription() => _completeQuestDescription != null;

  // "dialog" field.
  List<DialogStruct>? _dialog;
  List<DialogStruct> get dialog => _dialog ?? const [];
  bool hasDialog() => _dialog != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _questGiveDate = snapshotData['quest_give_date'] as DateTime?;
    _coordinate = snapshotData['coordinate'] as LatLng?;
    _gold = castToType<int>(snapshotData['gold']);
    _experience = castToType<int>(snapshotData['experience']);
    _icon = snapshotData['icon'] as String?;
    _questName = snapshotData['quest_name'] as String?;
    _nPCLocationName = snapshotData['NPC_location_name'] as String?;
    _description = snapshotData['description'] as String?;
    _completeQuestDescription =
        snapshotData['complete_quest_description'] as String?;
    _dialog = getStructList(
      snapshotData['dialog'],
      DialogStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('uncomplete_quests')
          : FirebaseFirestore.instance.collectionGroup('uncomplete_quests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('uncomplete_quests').doc(id);

  static Stream<UncompleteQuestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UncompleteQuestsRecord.fromSnapshot(s));

  static Future<UncompleteQuestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UncompleteQuestsRecord.fromSnapshot(s));

  static UncompleteQuestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UncompleteQuestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UncompleteQuestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UncompleteQuestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UncompleteQuestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UncompleteQuestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUncompleteQuestsRecordData({
  int? id,
  DateTime? questGiveDate,
  LatLng? coordinate,
  int? gold,
  int? experience,
  String? icon,
  String? questName,
  String? nPCLocationName,
  String? description,
  String? completeQuestDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'quest_give_date': questGiveDate,
      'coordinate': coordinate,
      'gold': gold,
      'experience': experience,
      'icon': icon,
      'quest_name': questName,
      'NPC_location_name': nPCLocationName,
      'description': description,
      'complete_quest_description': completeQuestDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class UncompleteQuestsRecordDocumentEquality
    implements Equality<UncompleteQuestsRecord> {
  const UncompleteQuestsRecordDocumentEquality();

  @override
  bool equals(UncompleteQuestsRecord? e1, UncompleteQuestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.questGiveDate == e2?.questGiveDate &&
        e1?.coordinate == e2?.coordinate &&
        e1?.gold == e2?.gold &&
        e1?.experience == e2?.experience &&
        e1?.icon == e2?.icon &&
        e1?.questName == e2?.questName &&
        e1?.nPCLocationName == e2?.nPCLocationName &&
        e1?.description == e2?.description &&
        e1?.completeQuestDescription == e2?.completeQuestDescription &&
        listEquality.equals(e1?.dialog, e2?.dialog);
  }

  @override
  int hash(UncompleteQuestsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.questGiveDate,
        e?.coordinate,
        e?.gold,
        e?.experience,
        e?.icon,
        e?.questName,
        e?.nPCLocationName,
        e?.description,
        e?.completeQuestDescription,
        e?.dialog
      ]);

  @override
  bool isValidKey(Object? o) => o is UncompleteQuestsRecord;
}
