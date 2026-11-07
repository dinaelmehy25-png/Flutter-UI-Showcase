import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_user.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'auth_view.dart';
import 'home_view.dart';

/// VIEW: shows the login screen or the home screen depending on auth state.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();

    return StreamBuilder<AppUser?>(
      stream: authViewModel.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final user = snapshot.data;
        return user == null ? const AuthView() : HomeView(user: user);
      },
    );
  }
}
