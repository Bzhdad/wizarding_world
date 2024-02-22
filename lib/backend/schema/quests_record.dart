import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestsRecord extends FirestoreRecord {
  QuestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "dialog" field.
  List<DialogStruct>? _dialog;
  List<DialogStruct> get dialog => _dialog ?? const [];
  bool hasDialog() => _dialog != null;

  // "complete_quest_description" field.
  String? _completeQuestDescription;
  String get completeQuestDescription => _completeQuestDescription ?? '';
  bool hasCompleteQuestDescription() => _completeQuestDescription != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "nextQuest" field.
  DocumentReference? _nextQuest;
  DocumentReference? get nextQuest => _nextQuest;
  bool hasNextQuest() => _nextQuest != null;

  void _initializeFields() {
    _icon = snapshotData['icon'] as String?;
    _questName = snapshotData['quest_name'] as String?;
    _nPCLocationName = snapshotData['NPC_location_name'] as String?;
    _description = snapshotData['description'] as String?;
    _dialog = getStructList(
      snapshotData['dialog'],
      DialogStruct.fromMap,
    );
    _completeQuestDescription =
        snapshotData['complete_quest_description'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _nextQuest = snapshotData['nextQuest'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quests');

  static Stream<QuestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestsRecord.fromSnapshot(s));

  static Future<QuestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestsRecord.fromSnapshot(s));

  static QuestsRecord fromSnapshot(DocumentSnapshot snapshot) => QuestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestsRecordData({
  String? icon,
  String? questName,
  String? nPCLocationName,
  String? description,
  String? completeQuestDescription,
  int? id,
  DocumentReference? nextQuest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icon': icon,
      'quest_name': questName,
      'NPC_location_name': nPCLocationName,
      'description': description,
      'complete_quest_description': completeQuestDescription,
      'id': id,
      'nextQuest': nextQuest,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestsRecordDocumentEquality implements Equality<QuestsRecord> {
  const QuestsRecordDocumentEquality();

  @override
  bool equals(QuestsRecord? e1, QuestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.icon == e2?.icon &&
        e1?.questName == e2?.questName &&
        e1?.nPCLocationName == e2?.nPCLocationName &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.dialog, e2?.dialog) &&
        e1?.completeQuestDescription == e2?.completeQuestDescription &&
        e1?.id == e2?.id &&
        e1?.nextQuest == e2?.nextQuest;
  }

  @override
  int hash(QuestsRecord? e) => const ListEquality().hash([
        e?.icon,
        e?.questName,
        e?.nPCLocationName,
        e?.description,
        e?.dialog,
        e?.completeQuestDescription,
        e?.id,
        e?.nextQuest
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestsRecord;
}
