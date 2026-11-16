import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:saia_da_5_serie/main.dart';

void main() {
  testWidgets('exibe a página principal', (tester) async {
    await tester.pumpWidget(const SaiaDa5SerieApp());

    expect(find.text('Saia da 5ª Série'), findsOneWidget);
    expect(find.text('Olá, estudante! 👋'), findsOneWidget);
    expect(find.text('Explore as matérias'), findsOneWidget);

    await tester.tap(find.text('Aprender'));
    await tester.pumpAndSettle();
    expect(find.text('Escolha uma matéria e avance no seu ritmo.'),
        findsOneWidget);

    await tester.tap(find.text('Conquistas'));
    await tester.pumpAndSettle();
    expect(find.text('Cada passo seu merece ser comemorado.'), findsOneWidget);

    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Acompanhe sua jornada de aprendizagem.'), findsOneWidget);

    await tester.tap(find.text('Receitas'));
    await tester.pumpAndSettle();
    expect(find.text('Nome da receita'), findsOneWidget);

    await tester.tap(find.text('Pesquisar receita'));
    await tester.pump();
    expect(find.text('Digite o nome de uma receita para pesquisar.'),
        findsOneWidget);

    await tester.enterText(find.byType(TextField), '  bolo   de   cenoura  ');
    await tester.tap(find.text('Pesquisar receita'));
    await tester.pump();
    expect(
      find.text('Pesquisa realizada para “bolo de cenoura”.',
          findRichText: true),
      findsOneWidget,
    );

    await tester.tap(find.text('Nova pesquisa'));
    await tester.pump();
    expect(find.text('Qual receita você quer encontrar?'), findsOneWidget);
  });
}
