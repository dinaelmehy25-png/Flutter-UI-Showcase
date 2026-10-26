import 'package:exercise_app/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFCDE8E9),
     appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 109, 173, 177),
     title: Text("Posts"),
     centerTitle: true,
     ),
     body:BlocBuilder<PostsCubit,PostsState>(
        builder: (context, state) {
          final cubit=context.read<PostsCubit>();

          if (state is PostsLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          } 

          else if (state is PostsErrorState) {
            return Center(
              child: Text('There\'s an error'),
            );
          } 
          
          return ListView.builder(
            itemCount: cubit.posts.length, 
            itemBuilder: (context, index) {
              final post = cubit.posts[index];
              return ListTile(
                title: Text(post.title ?? ''), 
                subtitle: Text(post.body ?? ''),
              );
            },
          );
        },
      ),
      
      
      
      
      
      
       
      );
  }
}