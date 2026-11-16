import 'package:flutter_test/flutter_test.dart';
import 'package:saia_da_5_serie/main.dart';

void main() {
  testWidgets('exibe a página principal', (tester) async {
    await tester.pumpWidget(const SaiaDa5SerieApp());

    expect(find.text('Saia da 5ª Série'), findsOneWidget);
    expect(find.text('Olá, estudante! 👋'), findsOneWidget);
    expect(find.text('Explore as matérias'), findsOneWidget);
  });
}
