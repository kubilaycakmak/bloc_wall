// GENERATED CODE - DO NOT MODIFY BY HAND

part of video_videos;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoVideos> _$videoVideosSerializer = new _$VideoVideosSerializer();

class _$VideoVideosSerializer implements StructuredSerializer<VideoVideos> {
  @override
  final Iterable<Type> types = const [VideoVideos, _$VideoVideos];
  @override
  final String wireName = 'VideoVideos';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoVideos object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'large',
      serializers.serialize(object.large,
          specifiedType: const FullType(VideoSize)),
      'medium',
      serializers.serialize(object.medium,
          specifiedType: const FullType(VideoSize)),
      'small',
      serializers.serialize(object.small,
          specifiedType: const FullType(VideoSize)),
      'tiny',
      serializers.serialize(object.tiny,
          specifiedType: const FullType(VideoSize)),
    ];

    return result;
  }

  @override
  VideoVideos deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoVideosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'large':
          result.large.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSize)) as VideoSize);
          break;
        case 'medium':
          result.medium.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSize)) as VideoSize);
          break;
        case 'small':
          result.small.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSize)) as VideoSize);
          break;
        case 'tiny':
          result.tiny.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSize)) as VideoSize);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoVideos extends VideoVideos {
  @override
  final VideoSize large;
  @override
  final VideoSize medium;
  @override
  final VideoSize small;
  @override
  final VideoSize tiny;

  factory _$VideoVideos([void Function(VideoVideosBuilder) updates]) =>
      (new VideoVideosBuilder()..update(updates)).build();

  _$VideoVideos._({this.large, this.medium, this.small, this.tiny})
      : super._() {
    if (large == null) {
      throw new BuiltValueNullFieldError('VideoVideos', 'large');
    }
    if (medium == null) {
      throw new BuiltValueNullFieldError('VideoVideos', 'medium');
    }
    if (small == null) {
      throw new BuiltValueNullFieldError('VideoVideos', 'small');
    }
    if (tiny == null) {
      throw new BuiltValueNullFieldError('VideoVideos', 'tiny');
    }
  }

  @override
  VideoVideos rebuild(void Function(VideoVideosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoVideosBuilder toBuilder() => new VideoVideosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoVideos &&
        large == other.large &&
        medium == other.medium &&
        small == other.small &&
        tiny == other.tiny;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, large.hashCode), medium.hashCode), small.hashCode),
        tiny.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoVideos')
          ..add('large', large)
          ..add('medium', medium)
          ..add('small', small)
          ..add('tiny', tiny))
        .toString();
  }
}

class VideoVideosBuilder implements Builder<VideoVideos, VideoVideosBuilder> {
  _$VideoVideos _$v;

  VideoSizeBuilder _large;
  VideoSizeBuilder get large => _$this._large ??= new VideoSizeBuilder();
  set large(VideoSizeBuilder large) => _$this._large = large;

  VideoSizeBuilder _medium;
  VideoSizeBuilder get medium => _$this._medium ??= new VideoSizeBuilder();
  set medium(VideoSizeBuilder medium) => _$this._medium = medium;

  VideoSizeBuilder _small;
  VideoSizeBuilder get small => _$this._small ??= new VideoSizeBuilder();
  set small(VideoSizeBuilder small) => _$this._small = small;

  VideoSizeBuilder _tiny;
  VideoSizeBuilder get tiny => _$this._tiny ??= new VideoSizeBuilder();
  set tiny(VideoSizeBuilder tiny) => _$this._tiny = tiny;

  VideoVideosBuilder();

  VideoVideosBuilder get _$this {
    if (_$v != null) {
      _large = _$v.large?.toBuilder();
      _medium = _$v.medium?.toBuilder();
      _small = _$v.small?.toBuilder();
      _tiny = _$v.tiny?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoVideos other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoVideos;
  }

  @override
  void update(void Function(VideoVideosBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoVideos build() {
    _$VideoVideos _$result;
    try {
      _$result = _$v ??
          new _$VideoVideos._(
              large: large.build(),
              medium: medium.build(),
              small: small.build(),
              tiny: tiny.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'large';
        large.build();
        _$failedField = 'medium';
        medium.build();
        _$failedField = 'small';
        small.build();
        _$failedField = 'tiny';
        tiny.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoVideos', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
