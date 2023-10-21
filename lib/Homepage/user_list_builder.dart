import 'package:bloc_example/Homepage/list_tile.dart';
import 'package:bloc_example/UsersListService/user_list_bloc.dart';
import 'package:bloc_example/UsersListService/user_list_event.dart';
import 'package:bloc_example/UsersListService/user_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListBuilder extends StatefulWidget {
  UserListBuilder({
    super.key,
  });

  @override
  State<UserListBuilder> createState() => _UserListBuilderState();
}

class _UserListBuilderState extends State<UserListBuilder> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: ((context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(
              child: Text("Error occured"),
            );
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(
                child: Text("no posts to fetch"),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return index >= state.posts.length
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : KisilerListTile(
                        city: state.posts[index].city,
                        gender: state.posts[index].gender,
                        name: state.posts[index].name,
                        number: state.posts[index].number,
                        town: state.posts[index].town,
                        photoUrl: state.posts[index].photoUrl);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          case PostStatus.initial:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
        }
      }),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
