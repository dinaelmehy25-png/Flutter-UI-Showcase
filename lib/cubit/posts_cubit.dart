import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:exercise_app/models/posts_model.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());


  List<UserModel> posts = [];

  Future<void> fetchPosts() async {
    
    emit(PostsLoadingState ());
    try {
      final response = await Dio().get("https://dummyjson.com/posts");

      List apiList = response.data["posts"];
      posts = apiList.map((e) => UserModel.fromJson(e)).toList();
      emit(PostsSuccessState ());
    } catch (e) {
      emit(PostsErrorState());
      print(e);
    }
  }



}
