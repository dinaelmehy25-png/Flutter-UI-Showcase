import 'package:flutter_test/flutter_test.dart';
import 'package:loginwithfirebase/models/app_user.dart';

// A simple test that doesn't need Firebase.
// (The default counter test can't run because MyApp needs Firebase to start.)
void main() {
  test('AppUser stores uid and email', () {
    const user = AppUser(uid: '123', email: 'test@example.com');
    expect(user.uid, '123');
    expect(user.email, 'test@example.com');
  });
}
