// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarjeta_digital/main.dart';

void main() {
  testWidgets('TarjetaDigital renders main content', (WidgetTester tester) async {
    // Construir la app y esperar animaciones.
    await tester.pumpWidget(const TarjetaDigital());
    await tester.pumpAndSettle();

    // Verificar textos clave presentes en la UI
    expect(find.text('Carlos Mamani'), findsOneWidget);
    expect(find.text('Desarrollador de Software'), findsOneWidget);

    // Verificar etiquetas de botones
    expect(find.text('LinkedIn'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('CV'), findsOneWidget);
    expect(find.text('StudyMate'), findsOneWidget);
  });
}
