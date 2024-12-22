import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('To-Do List app loads correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the title "To-Do List" appears.
    expect(find.text('To-Do List'), findsOneWidget);

    // Verify the "Add Task" button is present.
    expect(find.text('Add Task'), findsOneWidget);
  });
}
