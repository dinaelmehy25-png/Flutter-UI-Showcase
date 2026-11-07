/// MODEL: the plain data the rest of the app works with.
/// Views and ViewModels never touch Firebase's `User` class directly.
class AppUser {
  final String uid;
  final String email;

  const AppUser({required this.uid, required this.email});
}
