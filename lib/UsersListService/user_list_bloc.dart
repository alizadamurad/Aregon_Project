// import 'dart:async';

// import 'package:bloc_example/AuthRepo/user_repo.dart';
// import 'package:bloc_example/UsersListService/user_list_service.dart';

// class UserListBloc {
//   UserListService userListService = UserListService();
//   final _usersFetcher = StreamController<List<UserData>>();

//   Stream<List<UserData>> get usersData => _usersFetcher.stream;

//   fetchListOfUsers() async {
//     List<UserData> userData = await userListService.fetchUsersList(
//         "elizademurad03@gmail.com", "29_10_7715");
//     _usersFetcher.sink.add(userData);
//   }

//   dispose() {
//     _usersFetcher.close();
//   }
// }

// final UserListBloc userListBloc = UserListBloc();
import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_example/AuthRepo/user_repo.dart';
import 'package:bloc_example/UsersListService/user_list_event.dart';
import 'package:bloc_example/UsersListService/user_list_service.dart';
import 'package:bloc_example/UsersListService/user_list_state.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _fetchPosts();
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      print(e);

      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}

int startIndex = 1;

UserListService userListService = UserListService();

Future<List<UserData>> _fetchPosts() async {
  print("FETCHING POSTS");
  final response = await userListService.fetchUsersList(
      "elizademurad03@gmail.com", "29_10_7715", startIndex, '', '', ''
      // city_id,
      // cinsiyet,
      // kisi_ad,
      );

  if (response.statusCode == 200) {
    print("CODE 200!");
    startIndex++;
    print(startIndex);
    final body = json.decode(response.body)['kisiler']['data'] as List;

    print(body);
    print(body.runtimeType);

    return body.map((dynamic json) {
      final map = json as Map<String, dynamic>;
      return UserData(
        id: map['kisi_id'],
        name: map['kisi_ad'],
        city: map['city_name'],
        gender: map['cinsiyet'],
        number: map['kisi_tel'],
        photoUrl: map['resim'],
        town: map['town_name'],
      );
    }).toList();
  }
  throw Exception('error fetching posts');
}
