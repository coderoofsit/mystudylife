import 'package:flutter_test/flutter_test.dart';
import 'package:mystudylifeapp/src/app/app.dart';

void main() {
  testWidgets('Privacy screen loads as entry screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SuccessRoadApp());
    expect(find.text('Privacy & Data'), findsOneWidget);
  });
}
