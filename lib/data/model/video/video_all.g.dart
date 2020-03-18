// GENERATED CODE - DO NOT MODIFY BY HAND

part of video_all;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoAll> _$videoAllSerializer = new _$VideoAllSerializer();

class _$VideoAllSerializer implements StructuredSerializer<VideoAll> {
  @override
  final Iterable<Type> types = const [VideoAll, _$VideoAll];
  @override
  final String wireName = 'VideoAll';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoAll object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'totalHits',
      serializers.serialize(object.totalHits,
          specifiedType: const FullType(int)),
      'hits',
      serializers.serialize(object.hits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoHits)])),
    ];

    return result;
  }

  @override
  VideoAll deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoAllBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalHits':
          result.totalHits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hits':
          result.hits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoHits)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoAll extends VideoAll {
  @override
  final int total;
  @override
  final int totalHits;
  @override
  final BuiltList<VideoHits> hits;

  factory _$VideoAll([void Function(VideoAllBuilder) updates]) =>
      (new VideoAllBuilder()..update(updates)).build();

  _$VideoAll._({this.total, this.totalHits, this.hits}) : super._() {
    if (total == null) {
      throw new BuiltValueNullFieldError('VideoAll', 'total');
    }
    if (totalHits == null) {
      throw new BuiltValueNullFieldError('VideoAll', 'totalHits');
    }
    if (hits == null) {
      throw new BuiltValueNullFieldError('VideoAll', 'hits');
    }
  }

  @override
  VideoAll rebuild(void Function(VideoAllBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoAllBuilder toBuilder() => new VideoAllBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoAll &&
        total == other.total &&
        totalHits == other.totalHits &&
        hits == other.hits;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, total.hashCode), totalHits.hashCode), hits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoAll')
          ..add('total', total)
          ..add('totalHits', totalHits)
          ..add('hits', hits))
        .toString();
  }
}

class VideoAllBuilder implements Builder<VideoAll, VideoAllBuilder> {
  _$VideoAll _$v;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  int _totalHits;
  int get totalHits => _$this._totalHits;
  set totalHits(int totalHits) => _$this._totalHits = totalHits;

  ListBuilder<VideoHits> _hits;
  ListBuilder<VideoHits> get hits =>
      _$this._hits ??= new ListBuilder<VideoHits>();
  set hits(ListBuilder<VideoHits> hits) => _$this._hits = hits;

  VideoAllBuilder();

  VideoAllBuilder get _$this {
    if (_$v != null) {
      _total = _$v.total;
      _totalHits = _$v.totalHits;
      _hits = _$v.hits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoAll other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoAll;
  }

  @override
  void update(void Function(VideoAllBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoAll build() {
    _$VideoAll _$result;
    try {
      _$result = _$v ??
          new _$VideoAll._(
              total: total, totalHits: totalHits, hits: hits.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hits';
        hits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoAll', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
