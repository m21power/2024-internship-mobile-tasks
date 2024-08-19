import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myfirst_app/features/network/network_info.dart';

import '../product/test_helper.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  test('should return true when there is an internet connection', () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

    // Act
    final result = await networkInfoImpl.isConnected;

    // Assert
    expect(result, true);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });

  test('should return false when there is no internet connection', () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => false);

    // Act
    final result = await networkInfoImpl.isConnected;

    // Assert
    expect(result, false);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });
  test('should return true when there is an internet connection', () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

    // Act
    final result = await networkInfoImpl.isConnected;

    // Assert
    expect(result, true);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });

  test('should return false when there is no internet connection', () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => false);

    // Act
    final result = await networkInfoImpl.isConnected;

    // Assert
    expect(result, false);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });

  test('should return true when there is an internet connection after a delay',
      () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

    // Act
    final futureResult = networkInfoImpl.isConnected;
    await Future.delayed(Duration(seconds: 2));
    final result = await futureResult;

    // Assert
    expect(result, true);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });

  test('should return false when there is no internet connection after a delay',
      () async {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => false);

    // Act
    final futureResult = networkInfoImpl.isConnected;
    await Future.delayed(const Duration(seconds: 2));
    final result = await futureResult;

    // Assert
    expect(result, false);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });
}
