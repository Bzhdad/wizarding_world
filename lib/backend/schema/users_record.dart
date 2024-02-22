import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "experience" field.
  int? _experience;
  int get experience => _experience ?? 0;
  bool hasExperience() => _experience != null;

  // "gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  bool hasGold() => _gold != null;

  // "last_quest_creation_date" field.
  DateTime? _lastQuestCreationDate;
  DateTime? get lastQuestCreationDate => _lastQuestCreationDate;
  bool hasLastQuestCreationDate() => _lastQuestCreationDate != null;

  // "complete_quests" field.
  List<DocumentReference>? _completeQuests;
  List<DocumentReference> get completeQuests => _completeQuests ?? const [];
  bool hasCompleteQuests() => _completeQuests != null;

  // "uncomplete_quests" field.
  List<DocumentReference>? _uncompleteQuests;
  List<DocumentReference> get uncompleteQuests => _uncompleteQuests ?? const [];
  bool hasUncompleteQuests() => _uncompleteQuests != null;

  // "crystal" field.
  int? _crystal;
  int get crystal => _crystal ?? 0;
  bool hasCrystal() => _crystal != null;

  // "current_quests" field.
  List<DocumentReference>? _currentQuests;
  List<DocumentReference> get currentQuests => _currentQuests ?? const [];
  bool hasCurrentQuests() => _currentQuests != null;

  // "all_complete_quests" field.
  List<DocumentReference>? _allCompleteQuests;
  List<DocumentReference> get allCompleteQuests =>
      _allCompleteQuests ?? const [];
  bool hasAllCompleteQuests() => _allCompleteQuests != null;

  // "last_flower_creation_date" field.
  DateTime? _lastFlowerCreationDate;
  DateTime? get lastFlowerCreationDate => _lastFlowerCreationDate;
  bool hasLastFlowerCreationDate() => _lastFlowerCreationDate != null;

  // "current_flowers" field.
  List<DocumentReference>? _currentFlowers;
  List<DocumentReference> get currentFlowers => _currentFlowers ?? const [];
  bool hasCurrentFlowers() => _currentFlowers != null;

  // "inventory_flowers" field.
  DocumentReference? _inventoryFlowers;
  DocumentReference? get inventoryFlowers => _inventoryFlowers;
  bool hasInventoryFlowers() => _inventoryFlowers != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _gender = deserializeEnum<Gender>(snapshotData['gender']);
    _level = castToType<int>(snapshotData['level']);
    _experience = castToType<int>(snapshotData['experience']);
    _gold = castToType<int>(snapshotData['gold']);
    _lastQuestCreationDate =
        snapshotData['last_quest_creation_date'] as DateTime?;
    _completeQuests = getDataList(snapshotData['complete_quests']);
    _uncompleteQuests = getDataList(snapshotData['uncomplete_quests']);
    _crystal = castToType<int>(snapshotData['crystal']);
    _currentQuests = getDataList(snapshotData['current_quests']);
    _allCompleteQuests = getDataList(snapshotData['all_complete_quests']);
    _lastFlowerCreationDate =
        snapshotData['last_flower_creation_date'] as DateTime?;
    _currentFlowers = getDataList(snapshotData['current_flowers']);
    _inventoryFlowers = snapshotData['inventory_flowers'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? uid,
  Gender? gender,
  int? level,
  int? experience,
  int? gold,
  DateTime? lastQuestCreationDate,
  int? crystal,
  DateTime? lastFlowerCreationDate,
  DocumentReference? inventoryFlowers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'uid': uid,
      'gender': gender,
      'level': level,
      'experience': experience,
      'gold': gold,
      'last_quest_creation_date': lastQuestCreationDate,
      'crystal': crystal,
      'last_flower_creation_date': lastFlowerCreationDate,
      'inventory_flowers': inventoryFlowers,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.gender == e2?.gender &&
        e1?.level == e2?.level &&
        e1?.experience == e2?.experience &&
        e1?.gold == e2?.gold &&
        e1?.lastQuestCreationDate == e2?.lastQuestCreationDate &&
        listEquality.equals(e1?.completeQuests, e2?.completeQuests) &&
        listEquality.equals(e1?.uncompleteQuests, e2?.uncompleteQuests) &&
        e1?.crystal == e2?.crystal &&
        listEquality.equals(e1?.currentQuests, e2?.currentQuests) &&
        listEquality.equals(e1?.allCompleteQuests, e2?.allCompleteQuests) &&
        e1?.lastFlowerCreationDate == e2?.lastFlowerCreationDate &&
        listEquality.equals(e1?.currentFlowers, e2?.currentFlowers) &&
        e1?.inventoryFlowers == e2?.inventoryFlowers;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.uid,
        e?.gender,
        e?.level,
        e?.experience,
        e?.gold,
        e?.lastQuestCreationDate,
        e?.completeQuests,
        e?.uncompleteQuests,
        e?.crystal,
        e?.currentQuests,
        e?.allCompleteQuests,
        e?.lastFlowerCreationDate,
        e?.currentFlowers,
        e?.inventoryFlowers
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
