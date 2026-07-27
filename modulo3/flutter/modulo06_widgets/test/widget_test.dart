import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modulo06_widgets/main.dart';

void main() {
  testWidgets('muestra el saludo basico', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Saludo(),
        ),
      ),
    );

    expect(find.text('Hola Flutter'), findsOneWidget);
  });
}
