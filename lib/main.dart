import 'package:flutter/material.dart';

void main() {
  runApp(const SaiaDa5SerieApp());
}

class SaiaDa5SerieApp extends StatelessWidget {
  const SaiaDa5SerieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saia da 5ª Série',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C4AE8),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _purple = Color(0xFF6C4AE8);
  static const _ink = Color(0xFF24213A);
  static const _muted = Color(0xFF77738B);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 1:
        return const LearnPage();
      case 2:
        return const AchievementsPage();
      case 3:
        return const ProfilePage();
      case 4:
        return const RecipeSearchPage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildHeader(),
                const SizedBox(height: 28),
                _buildWelcomeCard(),
                const SizedBox(height: 28),
                _buildSectionTitle(
                  title: 'Continue de onde parou',
                  action: 'Ver tudo',
                ),
                const SizedBox(height: 14),
                _buildProgressCard(),
                const SizedBox(height: 28),
                _buildSectionTitle(
                  title: 'Explore as matérias',
                  action: 'Todas as matérias',
                ),
                const SizedBox(height: 14),
                _buildSubjects(),
                const SizedBox(height: 28),
                _buildChallengeCard(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _purple,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.auto_stories_rounded, color: Colors.white),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saia da 5ª Série',
                style: TextStyle(
                  color: _ink,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Aprender pode ser uma aventura.',
                style: TextStyle(color: _muted, fontSize: 12.5),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          tooltip: 'Notificações',
          icon: Icon(Icons.notifications_none_rounded, color: _ink),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFFFD7B5),
          child: Icon(Icons.face_rounded, color: Color(0xFF9A5C3A)),
        ),
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 16, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7250F0), Color(0xFF5C3DD2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x226C4AE8),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, estudante! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pronto para descobrir algo novo hoje?',
                  style: TextStyle(
                    color: Color(0xFFE9E3FF),
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
                SizedBox(height: 18),
                _PrimaryButton(label: 'Começar a estudar'),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.rocket_launch_rounded,
            size: 70,
            color: Color(0xFFFFD36E),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle({required String title, required String action}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: _ink,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: _purple,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 3),
        const Icon(Icons.chevron_right_rounded, size: 18, color: _purple),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE8FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.calculate_rounded, color: _purple),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Matemática',
                  style: TextStyle(
                    color: _ink,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Frações e números decimais',
                  style: TextStyle(color: _muted, fontSize: 12),
                ),
                SizedBox(height: 11),
                LinearProgressIndicator(
                  value: 0.68,
                  minHeight: 7,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  backgroundColor: Color(0xFFEDEAF5),
                  valueColor: AlwaysStoppedAnimation<Color>(_purple),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          const Text(
            '68%',
            style: TextStyle(
              color: _purple,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjects() {
    const subjects = [
      (
        'Português',
        Icons.menu_book_rounded,
        Color(0xFFFFE8D4),
        Color(0xFFE67C3B),
      ),
      ('Ciências', Icons.science_rounded, Color(0xFFDDF5E9), Color(0xFF3EAA72)),
      ('História', Icons.public_rounded, Color(0xFFFFE0E7), Color(0xFFE85C7A)),
      (
        'Geografia',
        Icons.explore_rounded,
        Color(0xFFDCEEFF),
        Color(0xFF4C8ED9),
      ),
    ];

    return SizedBox(
      height: 128,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Container(
            width: 116,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFEDEAF5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: subject.$3,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(subject.$2, color: subject.$4, size: 22),
                ),
                const Spacer(),
                Text(
                  subject.$1,
                  style: const TextStyle(
                    color: _ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChallengeCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4D9),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.emoji_events_rounded,
            color: Color(0xFFE99A20),
            size: 42,
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Desafio do dia',
                  style: TextStyle(
                    color: _ink,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Responda 3 perguntas e ganhe XP!',
                  style: TextStyle(color: _muted, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_rounded, color: Color(0xFFE99A20)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() => _selectedIndex = index);
      },
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFEDE8FF),
      height: 74,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded, color: _purple),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.school_outlined),
          selectedIcon: Icon(Icons.school_rounded, color: _purple),
          label: 'Aprender',
        ),
        NavigationDestination(
          icon: Icon(Icons.emoji_events_outlined),
          selectedIcon: Icon(Icons.emoji_events_rounded, color: _purple),
          label: 'Conquistas',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person_rounded, color: _purple),
          label: 'Perfil',
        ),
        NavigationDestination(
          icon: Icon(Icons.restaurant_menu_outlined),
          selectedIcon: Icon(Icons.restaurant_menu_rounded, color: _purple),
          label: 'Receitas',
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.white,
        disabledForegroundColor: const Color(0xFF5C3DD2),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
      ),
      child: Text(label),
    );
  }
}

class RecipeSearchPage extends StatefulWidget {
  const RecipeSearchPage({super.key});

  @override
  State<RecipeSearchPage> createState() => _RecipeSearchPageState();
}

class _RecipeSearchPageState extends State<RecipeSearchPage> {
  final _recipeController = TextEditingController();
  final _recipeFocusNode = FocusNode();
  String? _searchedTerm;
  String? _errorMessage;

  @override
  void dispose() {
    _recipeController.dispose();
    _recipeFocusNode.dispose();
    super.dispose();
  }

  void _searchRecipe() {
    final normalizedTerm =
        _recipeController.text.trim().replaceAll(RegExp(r'\s+'), ' ');

    if (normalizedTerm.isEmpty) {
      setState(() {
        _errorMessage = 'Digite o nome de uma receita para pesquisar.';
      });
      _recipeFocusNode.requestFocus();
      return;
    }

    setState(() {
      _errorMessage = null;
      _searchedTerm = normalizedTerm;
    });
  }

  void _newSearch() {
    setState(() {
      _recipeController.clear();
      _errorMessage = null;
      _searchedTerm = null;
    });
    _recipeFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PageHeader(
              title: 'Pesquisar receitas',
              subtitle: 'Encontre uma ideia gostosa para preparar.',
            ),
            const SizedBox(height: 22),
            _buildRecipeHero(),
            const SizedBox(height: 20),
            const Text(
              'O que você quer preparar?',
              style: TextStyle(
                color: Color(0xFF24213A),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            _buildSearchField(),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _searchRecipe,
                icon: const Icon(Icons.search_rounded),
                label: const Text('Pesquisar receita'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF6C4AE8),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(height: 18),
            _buildSuggestions(),
            const SizedBox(height: 26),
            if (_searchedTerm == null) _buildEmptyState(),
            if (_searchedTerm != null) _buildSearchFeedback(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 18, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7250F0), Color(0xFF5C3DD2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x226C4AE8),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cozinhe algo especial',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Pesquise pelo nome e descubra novas ideias.',
                  style: TextStyle(
                    color: Color(0xFFE9E3FF),
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.restaurant_rounded,
              color: Color(0xFFFFD36E),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _recipeController,
      builder: (context, value, child) {
        return TextField(
          controller: _recipeController,
          focusNode: _recipeFocusNode,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => _searchRecipe(),
          decoration: InputDecoration(
            labelText: 'Nome da receita',
            hintText: 'Ex.: bolo de cenoura',
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _recipeController.clear();
                        _errorMessage = null;
                      });
                    },
                    tooltip: 'Limpar pesquisa',
                    icon: const Icon(Icons.clear_rounded),
                  ),
            filled: true,
            fillColor: Colors.white,
            errorText: _errorMessage,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFEDEAF5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFEDEAF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide:
                  const BorderSide(color: Color(0xFF6C4AE8), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFD1435B)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide:
                  const BorderSide(color: Color(0xFFD1435B), width: 1.5),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSuggestions() {
    const suggestions = ['Bolo de cenoura', 'Panqueca', 'Macarrão'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sugestões rápidas',
          style: TextStyle(
            color: Color(0xFF77738B),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 9),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: suggestions
              .map(
                (suggestion) => ActionChip(
                  onPressed: () {
                    _recipeController.text = suggestion;
                    _recipeFocusNode.requestFocus();
                  },
                  avatar: const Icon(Icons.add_rounded, size: 16),
                  label: Text(suggestion),
                  labelStyle: const TextStyle(
                    color: Color(0xFF5C3DD2),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                  backgroundColor: const Color(0xFFEDE8FF),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEDEAF5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D24213A),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFFEDE8FF),
            child: Icon(Icons.restaurant_rounded,
                color: Color(0xFF6C4AE8), size: 30),
          ),
          SizedBox(height: 14),
          Text(
            'Qual receita você quer encontrar?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF24213A),
                fontSize: 17,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 6),
          Text(
            'Digite um nome acima e toque em “Pesquisar receita”.',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Color(0xFF77738B), fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchFeedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF5E9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFBCE6CF)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle_rounded, color: Color(0xFF2F925D)),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Pesquisa realizada para ',
                    style: const TextStyle(
                        color: Color(0xFF276B48), fontSize: 13, height: 1.4),
                    children: [
                      TextSpan(
                        text: '“$_searchedTerm”',
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Resultados provisórios',
          style: TextStyle(
              color: Color(0xFF24213A),
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEDEAF5)),
          ),
          child: const Row(
            children: [
              Icon(Icons.menu_book_rounded, color: Color(0xFFE67C3B), size: 34),
              SizedBox(width: 13),
              Expanded(
                child: Text(
                  'Os resultados da receita aparecerão aqui.',
                  style: TextStyle(
                      color: Color(0xFF77738B), fontSize: 12, height: 1.4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: _newSearch,
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Nova pesquisa'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF6C4AE8),
            side: const BorderSide(color: Color(0xFF6C4AE8)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ],
    );
  }
}

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  static const _purple = Color(0xFF6C4AE8);
  static const _ink = Color(0xFF24213A);
  static const _muted = Color(0xFF77738B);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PageHeader(
              title: 'Aprender',
              subtitle: 'Escolha uma matéria e avance no seu ritmo.',
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEDEAF5)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, color: _muted),
                  SizedBox(width: 10),
                  Text(
                    'Buscar uma aula ou assunto',
                    style: TextStyle(color: _muted, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Suas trilhas',
              style: TextStyle(
                color: _ink,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            const _LessonCard(
              icon: Icons.calculate_rounded,
              iconBackground: Color(0xFFEDE8FF),
              iconColor: _purple,
              subject: 'Matemática',
              lesson: 'Frações e números decimais',
              progress: 0.68,
              progressLabel: '68% concluído',
            ),
            const SizedBox(height: 12),
            const _LessonCard(
              icon: Icons.menu_book_rounded,
              iconBackground: Color(0xFFFFE8D4),
              iconColor: Color(0xFFE67C3B),
              subject: 'Português',
              lesson: 'Classes gramaticais',
              progress: 0.35,
              progressLabel: '35% concluído',
            ),
            const SizedBox(height: 28),
            const Text(
              'Todas as matérias',
              style: TextStyle(
                color: _ink,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _SubjectChip(
                  label: 'Ciências',
                  icon: Icons.science_rounded,
                  color: Color(0xFF3EAA72),
                ),
                _SubjectChip(
                  label: 'História',
                  icon: Icons.public_rounded,
                  color: Color(0xFFE85C7A),
                ),
                _SubjectChip(
                  label: 'Geografia',
                  icon: Icons.explore_rounded,
                  color: Color(0xFF4C8ED9),
                ),
                _SubjectChip(
                  label: 'Artes',
                  icon: Icons.palette_rounded,
                  color: Color(0xFF9A6CDA),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  static const _ink = Color(0xFF24213A);
  static const _muted = Color(0xFF77738B);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PageHeader(
              title: 'Conquistas',
              subtitle: 'Cada passo seu merece ser comemorado.',
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7250F0), Color(0xFF5C3DD2)],
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Row(
                children: [
                  Icon(Icons.emoji_events_rounded,
                      color: Color(0xFFFFD36E), size: 54),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Você está mandando bem!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Continue estudando para desbloquear novas medalhas.',
                          style: TextStyle(
                            color: Color(0xFFE9E3FF),
                            fontSize: 12,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                    child: _AchievementStat(
                        value: '1.240', label: 'XP acumulado')),
                SizedBox(width: 10),
                Expanded(
                    child: _AchievementStat(value: '8', label: 'medalhas')),
                SizedBox(width: 10),
                Expanded(
                    child:
                        _AchievementStat(value: '5 dias', label: 'sequência')),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Medalhas em destaque',
              style: TextStyle(
                color: _ink,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            const _BadgeCard(
              icon: Icons.local_fire_department_rounded,
              color: Color(0xFFE85C7A),
              title: 'Fogo nos estudos',
              description: 'Estudou por 5 dias seguidos.',
            ),
            const SizedBox(height: 12),
            const _BadgeCard(
              icon: Icons.menu_book_rounded,
              color: Color(0xFF4C8ED9),
              title: 'Leitor curioso',
              description: 'Completou 10 aulas de Português.',
            ),
            const SizedBox(height: 12),
            const _BadgeCard(
              icon: Icons.lock_rounded,
              color: Color(0xFFB7B2C7),
              title: 'Mestre das ciências',
              description: 'Falta completar 2 desafios.',
              locked: true,
            ),
            const SizedBox(height: 24),
            const Text(
              'A próxima conquista está logo ali.',
              style: TextStyle(color: _muted, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const _purple = Color(0xFF6C4AE8);
  static const _ink = Color(0xFF24213A);
  static const _muted = Color(0xFF77738B);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
        child: Column(
          children: [
            const _PageHeader(
              title: 'Meu perfil',
              subtitle: 'Acompanhe sua jornada de aprendizagem.',
            ),
            const SizedBox(height: 28),
            const CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFFFD7B5),
              child:
                  Icon(Icons.face_rounded, color: Color(0xFF9A5C3A), size: 42),
            ),
            const SizedBox(height: 12),
            const Text(
              'Estudante',
              style: TextStyle(
                color: _ink,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text('Nível 4 · Explorador do conhecimento',
                style: TextStyle(color: _muted, fontSize: 12)),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFEDEAF5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Progresso geral',
                          style: TextStyle(
                              color: _ink,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Text('42%',
                          style: TextStyle(
                              color: _purple, fontWeight: FontWeight.w800)),
                    ],
                  ),
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 0.42,
                    minHeight: 8,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    backgroundColor: Color(0xFFEDEAF5),
                    valueColor: AlwaysStoppedAnimation<Color>(_purple),
                  ),
                  SizedBox(height: 10),
                  Text('Você já completou 12 de 28 aulas.',
                      style: TextStyle(color: _muted, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _ProfileOption(
                icon: Icons.settings_outlined,
                title: 'Configurações',
                subtitle: 'Preferências do aplicativo'),
            const SizedBox(height: 10),
            const _ProfileOption(
                icon: Icons.notifications_none_rounded,
                title: 'Notificações',
                subtitle: 'Lembretes de estudo'),
            const SizedBox(height: 10),
            const _ProfileOption(
                icon: Icons.help_outline_rounded,
                title: 'Ajuda',
                subtitle: 'Dúvidas e suporte'),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF24213A),
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.7,
          ),
        ),
        const SizedBox(height: 5),
        Text(subtitle,
            style: const TextStyle(color: Color(0xFF77738B), fontSize: 13)),
      ],
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.subject,
    required this.lesson,
    required this.progress,
    required this.progressLabel,
  });

  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String subject;
  final String lesson;
  final double progress;
  final String progressLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: iconBackground, borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject,
                    style: const TextStyle(
                        color: Color(0xFF24213A),
                        fontSize: 14,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(lesson,
                    style: const TextStyle(
                        color: Color(0xFF77738B), fontSize: 11.5)),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  backgroundColor: const Color(0xFFEDEAF5),
                  valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                ),
                const SizedBox(height: 5),
                Text(progressLabel,
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.chevron_right_rounded, color: iconColor),
        ],
      ),
    );
  }
}

class _SubjectChip extends StatelessWidget {
  const _SubjectChip(
      {required this.label, required this.icon, required this.color});

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(label,
              style: const TextStyle(
                  color: Color(0xFF24213A),
                  fontSize: 12,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _AchievementStat extends StatelessWidget {
  const _AchievementStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Color(0xFF6C4AE8),
                  fontSize: 16,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF77738B), fontSize: 10)),
        ],
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  const _BadgeCard(
      {required this.icon,
      required this.color,
      required this.title,
      required this.description,
      this.locked = false});

  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF24213A),
                        fontSize: 14,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(
                        color: Color(0xFF77738B), fontSize: 11.5)),
              ],
            ),
          ),
          if (locked)
            const Icon(Icons.lock_outline_rounded,
                size: 19, color: Color(0xFFB7B2C7)),
          if (!locked)
            const Icon(Icons.check_circle_rounded,
                size: 20, color: Color(0xFF3EAA72)),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption(
      {required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDEAF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                color: const Color(0xFFEDE8FF),
                borderRadius: BorderRadius.circular(13)),
            child: Icon(icon, color: const Color(0xFF6C4AE8)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF24213A),
                        fontSize: 14,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style: const TextStyle(
                        color: Color(0xFF77738B), fontSize: 11.5)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFFB7B2C7)),
        ],
      ),
    );
  }
}
