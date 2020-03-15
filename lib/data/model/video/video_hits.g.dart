// GENERATED CODE - DO NOT MODIFY BY HAND

part of video_hits;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoHits> _$videoHitsSerializer = new _$VideoHitsSerializer();

class _$VideoHitsSerializer implements StructuredSerializer<VideoHits> {
  @override
  final Iterable<Type> types = const [VideoHits, _$VideoHits];
  @override
  final String wireName = 'VideoHits';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoHits object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'pageURL',
      serializers.serialize(object.pageURL,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags, specifiedType: const FullType(String)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(int)),
      'picture_id',
      serializers.serialize(object.pictureId,
          specifiedType: const FullType(int)),
      'videos',
      serializers.serialize(object.videos,
          specifiedType: const FullType(VideoVideos)),
      'views',
      serializers.serialize(object.views, specifiedType: const FullType(int)),
      'downloads',
      serializers.serialize(object.downloads,
          specifiedType: const FullType(int)),
      'favorites',
      serializers.serialize(object.favorites,
          specifiedType: const FullType(int)),
      'likes',
      serializers.serialize(object.likes, specifiedType: const FullType(int)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'userImageURL',
      serializers.serialize(object.userImageURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VideoHits deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoHitsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pageURL':
          result.pageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'picture_id':
          result.pictureId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoVideos)) as VideoVideos);
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'downloads':
          result.downloads = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'favorites':
          result.favorites = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userImageURL':
          result.userImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoHits extends VideoHits {
  @override
  final int id;
  @override
  final String pageURL;
  @override
  final String type;
  @override
  final String tags;
  @override
  final int duration;
  @override
  final int pictureId;
  @override
  final VideoVideos videos;
  @override
  final int views;
  @override
  final int downloads;
  @override
  final int favorites;
  @override
  final int likes;
  @override
  final int comments;
  @override
  final int userId;
  @override
  final String user;
  @override
  final String userImageURL;

  factory _$VideoHits([void Function(VideoHitsBuilder) updates]) =>
      (new VideoHitsBuilder()..update(updates)).build();

  _$VideoHits._(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.duration,
      this.pictureId,
      this.videos,
      this.views,
      this.downloads,
      this.favorites,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'id');
    }
    if (pageURL == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'pageURL');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'type');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'tags');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'duration');
    }
    if (pictureId == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'pictureId');
    }
    if (videos == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'videos');
    }
    if (views == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'views');
    }
    if (downloads == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'downloads');
    }
    if (favorites == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'favorites');
    }
    if (likes == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'likes');
    }
    if (comments == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'comments');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'userId');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'user');
    }
    if (userImageURL == null) {
      throw new BuiltValueNullFieldError('VideoHits', 'userImageURL');
    }
  }

  @override
  VideoHits rebuild(void Function(VideoHitsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoHitsBuilder toBuilder() => new VideoHitsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoHits &&
        id == other.id &&
        pageURL == other.pageURL &&
        type == other.type &&
        tags == other.tags &&
        duration == other.duration &&
        pictureId == other.pictureId &&
        videos == other.videos &&
        views == other.views &&
        downloads == other.downloads &&
        favorites == other.favorites &&
        likes == other.likes &&
        comments == other.comments &&
        userId == other.userId &&
        user == other.user &&
        userImageURL == other.userImageURL;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc($jc(0, id.hashCode),
                                                            pageURL.hashCode),
                                                        type.hashCode),
                                                    tags.hashCode),
                                                duration.hashCode),
                                            pictureId.hashCode),
                                        videos.hashCode),
                                    views.hashCode),
                                downloads.hashCode),
                            favorites.hashCode),
                        likes.hashCode),
                    comments.hashCode),
                userId.hashCode),
            user.hashCode),
        userImageURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoHits')
          ..add('id', id)
          ..add('pageURL', pageURL)
          ..add('type', type)
          ..add('tags', tags)
          ..add('duration', duration)
          ..add('pictureId', pictureId)
          ..add('videos', videos)
          ..add('views', views)
          ..add('downloads', downloads)
          ..add('favorites', favorites)
          ..add('likes', likes)
          ..add('comments', comments)
          ..add('userId', userId)
          ..add('user', user)
          ..add('userImageURL', userImageURL))
        .toString();
  }
}

class VideoHitsBuilder implements Builder<VideoHits, VideoHitsBuilder> {
  _$VideoHits _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _pageURL;
  String get pageURL => _$this._pageURL;
  set pageURL(String pageURL) => _$this._pageURL = pageURL;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _tags;
  String get tags => _$this._tags;
  set tags(String tags) => _$this._tags = tags;

  int _duration;
  int get duration => _$this._duration;
  set duration(int duration) => _$this._duration = duration;

  int _pictureId;
  int get pictureId => _$this._pictureId;
  set pictureId(int pictureId) => _$this._pictureId = pictureId;

  VideoVideosBuilder _videos;
  VideoVideosBuilder get videos => _$this._videos ??= new VideoVideosBuilder();
  set videos(VideoVideosBuilder videos) => _$this._videos = videos;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  int _downloads;
  int get downloads => _$this._downloads;
  set downloads(int downloads) => _$this._downloads = downloads;

  int _favorites;
  int get favorites => _$this._favorites;
  set favorites(int favorites) => _$this._favorites = favorites;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  int _comments;
  int get comments => _$this._comments;
  set comments(int comments) => _$this._comments = comments;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  String _userImageURL;
  String get userImageURL => _$this._userImageURL;
  set userImageURL(String userImageURL) => _$this._userImageURL = userImageURL;

  VideoHitsBuilder();

  VideoHitsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _pageURL = _$v.pageURL;
      _type = _$v.type;
      _tags = _$v.tags;
      _duration = _$v.duration;
      _pictureId = _$v.pictureId;
      _videos = _$v.videos?.toBuilder();
      _views = _$v.views;
      _downloads = _$v.downloads;
      _favorites = _$v.favorites;
      _likes = _$v.likes;
      _comments = _$v.comments;
      _userId = _$v.userId;
      _user = _$v.user;
      _userImageURL = _$v.userImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoHits other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoHits;
  }

  @override
  void update(void Function(VideoHitsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoHits build() {
    _$VideoHits _$result;
    try {
      _$result = _$v ??
          new _$VideoHits._(
              id: id,
              pageURL: pageURL,
              type: type,
              tags: tags,
              duration: duration,
              pictureId: pictureId,
              videos: videos.build(),
              views: views,
              downloads: downloads,
              favorites: favorites,
              likes: likes,
              comments: comments,
              userId: userId,
              user: user,
              userImageURL: userImageURL);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videos';
        videos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoHits', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
