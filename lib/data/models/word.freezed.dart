// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordTranslations _$WordTranslationsFromJson(Map<String, dynamic> json) {
  return _WordTranslations.fromJson(json);
}

/// @nodoc
mixin _$WordTranslations {
  @HiveField(0)
  String get es => throw _privateConstructorUsedError;
  @HiveField(1)
  String get en => throw _privateConstructorUsedError;
  @HiveField(2)
  String get it => throw _privateConstructorUsedError;
  @HiveField(3)
  String get fr => throw _privateConstructorUsedError;
  @HiveField(4)
  String get de => throw _privateConstructorUsedError;
  @HiveField(5)
  String get pt => throw _privateConstructorUsedError;

  /// Serializes this WordTranslations to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordTranslationsCopyWith<WordTranslations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordTranslationsCopyWith<$Res> {
  factory $WordTranslationsCopyWith(
          WordTranslations value, $Res Function(WordTranslations) then) =
      _$WordTranslationsCopyWithImpl<$Res, WordTranslations>;
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class _$WordTranslationsCopyWithImpl<$Res, $Val extends WordTranslations>
    implements $WordTranslationsCopyWith<$Res> {
  _$WordTranslationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_value.copyWith(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordTranslationsImplCopyWith<$Res>
    implements $WordTranslationsCopyWith<$Res> {
  factory _$$WordTranslationsImplCopyWith(_$WordTranslationsImpl value,
          $Res Function(_$WordTranslationsImpl) then) =
      __$$WordTranslationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class __$$WordTranslationsImplCopyWithImpl<$Res>
    extends _$WordTranslationsCopyWithImpl<$Res, _$WordTranslationsImpl>
    implements _$$WordTranslationsImplCopyWith<$Res> {
  __$$WordTranslationsImplCopyWithImpl(_$WordTranslationsImpl _value,
      $Res Function(_$WordTranslationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_$WordTranslationsImpl(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordTranslationsImpl implements _WordTranslations {
  const _$WordTranslationsImpl(
      {@HiveField(0) required this.es,
      @HiveField(1) required this.en,
      @HiveField(2) required this.it,
      @HiveField(3) required this.fr,
      @HiveField(4) required this.de,
      @HiveField(5) required this.pt});

  factory _$WordTranslationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordTranslationsImplFromJson(json);

  @override
  @HiveField(0)
  final String es;
  @override
  @HiveField(1)
  final String en;
  @override
  @HiveField(2)
  final String it;
  @override
  @HiveField(3)
  final String fr;
  @override
  @HiveField(4)
  final String de;
  @override
  @HiveField(5)
  final String pt;

  @override
  String toString() {
    return 'WordTranslations(es: $es, en: $en, it: $it, fr: $fr, de: $de, pt: $pt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordTranslationsImpl &&
            (identical(other.es, es) || other.es == es) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.it, it) || other.it == it) &&
            (identical(other.fr, fr) || other.fr == fr) &&
            (identical(other.de, de) || other.de == de) &&
            (identical(other.pt, pt) || other.pt == pt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, es, en, it, fr, de, pt);

  /// Create a copy of WordTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordTranslationsImplCopyWith<_$WordTranslationsImpl> get copyWith =>
      __$$WordTranslationsImplCopyWithImpl<_$WordTranslationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordTranslationsImplToJson(
      this,
    );
  }
}

abstract class _WordTranslations implements WordTranslations {
  const factory _WordTranslations(
      {@HiveField(0) required final String es,
      @HiveField(1) required final String en,
      @HiveField(2) required final String it,
      @HiveField(3) required final String fr,
      @HiveField(4) required final String de,
      @HiveField(5) required final String pt}) = _$WordTranslationsImpl;

  factory _WordTranslations.fromJson(Map<String, dynamic> json) =
      _$WordTranslationsImpl.fromJson;

  @override
  @HiveField(0)
  String get es;
  @override
  @HiveField(1)
  String get en;
  @override
  @HiveField(2)
  String get it;
  @override
  @HiveField(3)
  String get fr;
  @override
  @HiveField(4)
  String get de;
  @override
  @HiveField(5)
  String get pt;

  /// Create a copy of WordTranslations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordTranslationsImplCopyWith<_$WordTranslationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordMeanings _$WordMeaningsFromJson(Map<String, dynamic> json) {
  return _WordMeanings.fromJson(json);
}

/// @nodoc
mixin _$WordMeanings {
  @HiveField(0)
  String get es => throw _privateConstructorUsedError;
  @HiveField(1)
  String get en => throw _privateConstructorUsedError;
  @HiveField(2)
  String get it => throw _privateConstructorUsedError;
  @HiveField(3)
  String get fr => throw _privateConstructorUsedError;
  @HiveField(4)
  String get de => throw _privateConstructorUsedError;
  @HiveField(5)
  String get pt => throw _privateConstructorUsedError;

  /// Serializes this WordMeanings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordMeanings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMeaningsCopyWith<WordMeanings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMeaningsCopyWith<$Res> {
  factory $WordMeaningsCopyWith(
          WordMeanings value, $Res Function(WordMeanings) then) =
      _$WordMeaningsCopyWithImpl<$Res, WordMeanings>;
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class _$WordMeaningsCopyWithImpl<$Res, $Val extends WordMeanings>
    implements $WordMeaningsCopyWith<$Res> {
  _$WordMeaningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMeanings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_value.copyWith(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordMeaningsImplCopyWith<$Res>
    implements $WordMeaningsCopyWith<$Res> {
  factory _$$WordMeaningsImplCopyWith(
          _$WordMeaningsImpl value, $Res Function(_$WordMeaningsImpl) then) =
      __$$WordMeaningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String es,
      @HiveField(1) String en,
      @HiveField(2) String it,
      @HiveField(3) String fr,
      @HiveField(4) String de,
      @HiveField(5) String pt});
}

/// @nodoc
class __$$WordMeaningsImplCopyWithImpl<$Res>
    extends _$WordMeaningsCopyWithImpl<$Res, _$WordMeaningsImpl>
    implements _$$WordMeaningsImplCopyWith<$Res> {
  __$$WordMeaningsImplCopyWithImpl(
      _$WordMeaningsImpl _value, $Res Function(_$WordMeaningsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordMeanings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? es = null,
    Object? en = null,
    Object? it = null,
    Object? fr = null,
    Object? de = null,
    Object? pt = null,
  }) {
    return _then(_$WordMeaningsImpl(
      es: null == es
          ? _value.es
          : es // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      it: null == it
          ? _value.it
          : it // ignore: cast_nullable_to_non_nullable
              as String,
      fr: null == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as String,
      de: null == de
          ? _value.de
          : de // ignore: cast_nullable_to_non_nullable
              as String,
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordMeaningsImpl implements _WordMeanings {
  const _$WordMeaningsImpl(
      {@HiveField(0) required this.es,
      @HiveField(1) required this.en,
      @HiveField(2) required this.it,
      @HiveField(3) required this.fr,
      @HiveField(4) required this.de,
      @HiveField(5) required this.pt});

  factory _$WordMeaningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordMeaningsImplFromJson(json);

  @override
  @HiveField(0)
  final String es;
  @override
  @HiveField(1)
  final String en;
  @override
  @HiveField(2)
  final String it;
  @override
  @HiveField(3)
  final String fr;
  @override
  @HiveField(4)
  final String de;
  @override
  @HiveField(5)
  final String pt;

  @override
  String toString() {
    return 'WordMeanings(es: $es, en: $en, it: $it, fr: $fr, de: $de, pt: $pt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMeaningsImpl &&
            (identical(other.es, es) || other.es == es) &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.it, it) || other.it == it) &&
            (identical(other.fr, fr) || other.fr == fr) &&
            (identical(other.de, de) || other.de == de) &&
            (identical(other.pt, pt) || other.pt == pt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, es, en, it, fr, de, pt);

  /// Create a copy of WordMeanings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMeaningsImplCopyWith<_$WordMeaningsImpl> get copyWith =>
      __$$WordMeaningsImplCopyWithImpl<_$WordMeaningsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordMeaningsImplToJson(
      this,
    );
  }
}

abstract class _WordMeanings implements WordMeanings {
  const factory _WordMeanings(
      {@HiveField(0) required final String es,
      @HiveField(1) required final String en,
      @HiveField(2) required final String it,
      @HiveField(3) required final String fr,
      @HiveField(4) required final String de,
      @HiveField(5) required final String pt}) = _$WordMeaningsImpl;

  factory _WordMeanings.fromJson(Map<String, dynamic> json) =
      _$WordMeaningsImpl.fromJson;

  @override
  @HiveField(0)
  String get es;
  @override
  @HiveField(1)
  String get en;
  @override
  @HiveField(2)
  String get it;
  @override
  @HiveField(3)
  String get fr;
  @override
  @HiveField(4)
  String get de;
  @override
  @HiveField(5)
  String get pt;

  /// Create a copy of WordMeanings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMeaningsImplCopyWith<_$WordMeaningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get level => throw _privateConstructorUsedError;
  @HiveField(2)
  int get group => throw _privateConstructorUsedError;
  @HiveField(3)
  WordTranslations get names => throw _privateConstructorUsedError;
  @HiveField(4)
  WordMeanings get meanings => throw _privateConstructorUsedError;

  /// Serializes this Word to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String level,
      @HiveField(2) int group,
      @HiveField(3) WordTranslations names,
      @HiveField(4) WordMeanings meanings});

  $WordTranslationsCopyWith<$Res> get names;
  $WordMeaningsCopyWith<$Res> get meanings;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
    Object? group = null,
    Object? names = null,
    Object? meanings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as WordTranslations,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as WordMeanings,
    ) as $Val);
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordTranslationsCopyWith<$Res> get names {
    return $WordTranslationsCopyWith<$Res>(_value.names, (value) {
      return _then(_value.copyWith(names: value) as $Val);
    });
  }

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordMeaningsCopyWith<$Res> get meanings {
    return $WordMeaningsCopyWith<$Res>(_value.meanings, (value) {
      return _then(_value.copyWith(meanings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordImplCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$WordImplCopyWith(
          _$WordImpl value, $Res Function(_$WordImpl) then) =
      __$$WordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String level,
      @HiveField(2) int group,
      @HiveField(3) WordTranslations names,
      @HiveField(4) WordMeanings meanings});

  @override
  $WordTranslationsCopyWith<$Res> get names;
  @override
  $WordMeaningsCopyWith<$Res> get meanings;
}

/// @nodoc
class __$$WordImplCopyWithImpl<$Res>
    extends _$WordCopyWithImpl<$Res, _$WordImpl>
    implements _$$WordImplCopyWith<$Res> {
  __$$WordImplCopyWithImpl(_$WordImpl _value, $Res Function(_$WordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
    Object? group = null,
    Object? names = null,
    Object? meanings = null,
  }) {
    return _then(_$WordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as WordTranslations,
      meanings: null == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as WordMeanings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordImpl extends _Word {
  const _$WordImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.level,
      @HiveField(2) required this.group,
      @HiveField(3) required this.names,
      @HiveField(4) required this.meanings})
      : super._();

  factory _$WordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String level;
  @override
  @HiveField(2)
  final int group;
  @override
  @HiveField(3)
  final WordTranslations names;
  @override
  @HiveField(4)
  final WordMeanings meanings;

  @override
  String toString() {
    return 'Word(id: $id, level: $level, group: $group, names: $names, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.names, names) || other.names == names) &&
            (identical(other.meanings, meanings) ||
                other.meanings == meanings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, level, group, names, meanings);

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      __$$WordImplCopyWithImpl<_$WordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordImplToJson(
      this,
    );
  }
}

abstract class _Word extends Word {
  const factory _Word(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String level,
      @HiveField(2) required final int group,
      @HiveField(3) required final WordTranslations names,
      @HiveField(4) required final WordMeanings meanings}) = _$WordImpl;
  const _Word._() : super._();

  factory _Word.fromJson(Map<String, dynamic> json) = _$WordImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get level;
  @override
  @HiveField(2)
  int get group;
  @override
  @HiveField(3)
  WordTranslations get names;
  @override
  @HiveField(4)
  WordMeanings get meanings;

  /// Create a copy of Word
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordImplCopyWith<_$WordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
