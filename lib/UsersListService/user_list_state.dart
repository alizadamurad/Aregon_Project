import 'package:bloc_example/AuthRepo/user_repo.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <UserData>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<UserData> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<UserData>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
