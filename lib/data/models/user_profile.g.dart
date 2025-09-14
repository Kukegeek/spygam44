// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 6;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfile(
      userId: fields[0] as String,
      email: fields[1] as String,
      nativeLanguage: fields[2] as String,
      learningLanguage: fields[3] as String,
      scores: (fields[4] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map).cast<String, int>())),
      lastUpdated: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.nativeLanguage)
      ..writeByte(3)
      ..write(obj.learningLanguage)
      ..writeByte(4)
      ..write(obj.scores)
      ..writeByte(5)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['userId'] as String,
      email: json['email'] as String,
      nativeLanguage: json['nativeLanguage'] as String,
      learningLanguage: json['learningLanguage'] as String,
      scores: (json['scores'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, int>.from(e as Map)),
      ),
      lastUpdated: (json['lastUpdated'] as num).toInt(),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'nativeLanguage': instance.nativeLanguage,
      'learningLanguage': instance.learningLanguage,
      'scores': instance.scores,
      'lastUpdated': instance.lastUpdated,
    };
