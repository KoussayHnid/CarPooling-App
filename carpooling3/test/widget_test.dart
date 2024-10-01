import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carpooling3/main.dart';

void main() {
  testWidgets('Login navigates to Search screen', (WidgetTester tester) async {
    await tester.pumpWidget(const Carpooling3());
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Search Rides'), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
  });

  testWidgets('Navigate to Ride Details screen', (WidgetTester tester) async {
    await tester.pumpWidget(const Carpooling3());

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    expect(find.text('Ride Details'), findsOneWidget);
    expect(find.text('Book Ride'), findsOneWidget);
  });

  testWidgets('Booking a ride navigates to Booking Confirmation screen', (WidgetTester tester) async {
    await tester.pumpWidget(const Carpooling3()); // Added const

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Book Ride'));
    await tester.pumpAndSettle();

    expect(find.text('Booking Confirmed!'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
}
