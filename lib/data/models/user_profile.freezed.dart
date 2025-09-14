// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @HiveField(0)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get nativeLanguage => throw _privateConstructorUsedError;
  @HiveField(3)
  String get learningLanguage => throw _privateConstructorUsedError;
  @HiveField(4)
  Map<String, Map<String, int>> get scores =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  int get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) String email,
      @HiveField(2) String nativeLanguage,
      @HiveField(3) String learningLanguage,
      @HiveField(4) Map<String, Map<String, int>> scores,
      @HiveField(5) int lastUpdated});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? nativeLanguage = null,
    Object? learningLanguage = null,
    Object? scores = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      learningLanguage: null == learningLanguage
          ? _value.learningLanguage
          : learningLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) String email,
      @HiveField(2) String nativeLanguage,
      @HiveField(3) String learningLanguage,
      @HiveField(4) Map<String, Map<String, int>> scores,
      @HiveField(5) int lastUpdated});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? nativeLanguage = null,
    Object? learningLanguage = null,
    Object? scores = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$UserProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nativeLanguage: null == nativeLanguage
          ? _value.nativeLanguage
          : nativeLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      learningLanguage: null == learningLanguage
          ? _value.learningLanguage
          : learningLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      scores: null == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl(
      {@HiveField(0) required this.userId,
      @HiveField(1) required this.email,
      @HiveField(2) required this.nativeLanguage,
      @HiveField(3) required this.learningLanguage,
      @HiveField(4) required final Map<String, Map<String, int>> scores,
      @HiveField(5) required this.lastUpdated})
      : _scores = scores,
        super._();

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @HiveField(0)
  final String userId;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String nativeLanguage;
  @override
  @HiveField(3)
  final String learningLanguage;
  final Map<String, Map<String, int>> _scores;
  @override
  @HiveField(4)
  Map<String, Map<String, int>> get scores {
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_scores);
  }

  @override
  @HiveField(5)
  final int lastUpdated;

  @override
  String toString() {
    return 'UserProfile(userId: $userId, email: $email, nativeLanguage: $nativeLanguage, learningLanguage: $learningLanguage, scores: $scores, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nativeLanguage, nativeLanguage) ||
                other.nativeLanguage == nativeLanguage) &&
            (identical(other.learningLanguage, learningLanguage) ||
                other.learningLanguage == learningLanguage) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      email,
      nativeLanguage,
      learningLanguage,
      const DeepCollectionEquality().hash(_scores),
      lastUpdated);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {@HiveField(0) required final String userId,
      @HiveField(1) required final String email,
      @HiveField(2) required final String nativeLanguage,
      @HiveField(3) required final String learningLanguage,
      @HiveField(4) required final Map<String, Map<String, int>> scores,
      @HiveField(5) required final int lastUpdated}) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @HiveField(0)
  String get userId;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get nativeLanguage;
  @override
  @HiveField(3)
  String get learningLanguage;
  @override
  @HiveField(4)
  Map<String, Map<String, int>> get scores;
  @override
  @HiveField(5)
  int get lastUpdated;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
