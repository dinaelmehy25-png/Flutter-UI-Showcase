import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/config_viewmodel.dart';

/// VIEW: one screen for both Log in and Sign up.
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();
    final welcome = context.watch<ConfigViewModel>().welcomeMessage;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              // Keeps the form a comfortable width on tablets and web.
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text from Firebase Remote Config.
                  Text(welcome, style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(
                    vm.isLoginMode ? 'Log in to continue.' : 'Create an account to get started.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                    onSubmitted: (_) => _submit(vm),
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  if (vm.errorMessage != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      vm.errorMessage!,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: vm.isLoading ? null : () => _submit(vm),
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                    child: vm.isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2.5),
                          )
                        : Text(vm.isLoginMode ? 'Log in' : 'Sign up'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: vm.isLoading ? null : vm.toggleMode,
                    child: Text(
                      vm.isLoginMode
                          ? 'New here? Create an account'
                          : 'Already have an account? Log in',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit(AuthViewModel vm) {
    FocusScope.of(context).unfocus();
    vm.submit(_emailController.text, _passwordController.text);
  }
}
