import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_testing/model/user.dart';
import 'package:unit_testing/network_service/user_repository.dart';

class MockApiClient extends Mock implements Client {}

void main() {
  late MockApiClient mockApiClient;
  late UserRepository userRepository;

  setUp(() {
    mockApiClient = MockApiClient();
    userRepository = UserRepository(mockApiClient);
  });

  group('User repository - ', () {
    group('getUser() - ', () {
      test('Test for responseCode is 200 and user data with json', () async {
        // Arrange
        // Act
        when(() => mockApiClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            )).thenAnswer((value) async {
          return Response('''
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz"
          }
            ''', 200);
        });

        final user = await userRepository.getUser();
        expect(user, isA<User>());
      });

      test(
        'Test for responseCode is not 200 and error exception',
        () async {
          // Arrange
          // Act
          when(() => mockApiClient.get(
                Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
              )).thenAnswer((value) async {
            return Response('{}', 500);
          });
          final user = userRepository.getUser();
          expect(user, throwsException);
        },
      );
    });
  });
}
