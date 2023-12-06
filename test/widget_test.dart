import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/Rating/star_rating.dart';
import 'package:project/main.dart';

void main() {
  testWidgets('Test UI for CombinedApp widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app starts with the title 'Combined App'.
    expect(find.text('Combined App'), findsOneWidget);

    //-------------------------------------------------------------//
    //-------------------- Test UI for Popup 1 --------------------//
    //-------------------------------------------------------------//
    // Tap on the 'Show Popup 1' button and verify the appearance of the popup.
    await tester.tap(find.text('Show Popup 1'));
    await tester.pumpAndSettle(); // Wait for animations to complete.
    expect(find.text('Popup 1'), findsOneWidget);
    expect(
        find.text(
            'This is the classic popup, without a timer and not much else! Let\'s dive into the other examples!'),
        findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    // Tap on the 'OK' button to close the popup.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Wait for animations to complete.
    expect(find.text('Popup 1'), findsNothing);

    //-------------------------------------------------------------//
    //-------------------- Test UI for Popup 2 --------------------//
    //-------------------------------------------------------------//
    // Tap on the 'Show Popup 2' button and verify the appearance of the popup.
    await tester.tap(find.text('Show Popup 2'));
    await tester.pumpAndSettle(); // Wait for animations to complete.
    expect(find.text('Popup 2'), findsOneWidget);
    expect(find.text('This is the second popup with a timer!'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);

    // Verify that the timer is displayed.
    expect(find.byIcon(Icons.timer), findsOneWidget);

    // Tap on the 'Close' button to close the popup.
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle(); // Wait for animations to complete.
    expect(find.text('Popup 2'), findsNothing);

    //-------------------------------------------------------------//
    //-------------------- Test UI for Rating Components --------------------//
    //-------------------------------------------------------------//
    final Iterable<Widget> starWidgetsIterable =
        tester.widgetList(find.byType(Star));
    final List<Widget> starWidgets = starWidgetsIterable.toList();
    expect(starWidgets.length, equals(15.0));

    // Find the StarRating widget in the first example using generic criteria
    final starRatingWidget = find.byType(StarRating).first;
    // Verify that the StarRating widget is present
    expect(starRatingWidget, findsOneWidget);
    final initialRating = tester.widget<StarRating>(starRatingWidget).rating;
    expect(initialRating, equals(2.0));
    final starRatingWidget2 = find.byType(StarRating).last;
    // Verify that the StarRating widget is present
    expect(starRatingWidget2, findsOneWidget);
    // Get the initial rating
    final initialRating2 = tester.widget<StarRating>(starRatingWidget2).rating;
    // Verify the initial rating is as expected
    expect(initialRating2, equals(0.0));
  });
}
