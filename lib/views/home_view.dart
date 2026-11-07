import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_user.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/config_viewmodel.dart';

/// VIEW: shown after a successful login or sign-up.
class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(
                      user.email.isNotEmpty ? user.email[0].toUpperCase() : '?',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Text from Firebase Remote Config.
                  Text(
                    config.welcomeMessage,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Signed in as ${user.email}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Button label from Firebase Remote Config.
                  FilledButton.tonal(
                    onPressed: () => context.read<AuthViewModel>().signOut(),
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                    child: Text(config.buttonText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
