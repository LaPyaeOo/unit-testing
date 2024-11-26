import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/logic/counter.dart';

void main() {
  late Counter counter;
  // Runs before each test in a group or suite
  // Use this for setting up fresh state before each test. It ensures that each test starts with a clean environment
  //  When the setup needs to be reset for each test
  setUp(() {
    counter = Counter();
  });

  // Runs once before all the tests in a group or suite
  // Use this for one-time setup that is shared among all tests in the group or suite
  // When the setup is expensive or doesn't need to be reset between tests
  setUpAll(() => null);

  tearDown(() => null);
  tearDownAll(() => null);

  group('Counter class - ', () {
    test(
      'Given value must be 0 at instantiated state',
      () {
        // Arrange

        // Act
        final val = counter.countedValue;
        // Assert
        expect(val, 0);
      },
    );

    test(
      'increaseOne function must be increase one to countedValue',
      () {
        // Arrange

        // Act
        counter.increaseOne();
        final value = counter.countedValue;
        // Assert
        expect(value, 1);
      },
    );
      test('reset function must be reset value to Zero',(){

        // Act
        counter.reset();
        final value = counter.countedValue;
        // Assert
        expect(value, 0);
      });

  });
}
