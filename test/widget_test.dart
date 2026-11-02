// Teste de fumaça do painel Andon: monta na resolução de destino (Full HD)
// sem exceção de build nem overflow, e desmonta para cancelar o timer do relógio.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:andon_dashboard/main.dart';

void main() {
  testWidgets('painel monta em 1920x1080 sem erro', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AndonApp());
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
