// lib/main_mp.dart
// ─────────────────────────────────────────────────────────────────────────
//  MI PROYECTO · VetConnect — Módulo 10: Gestión de estado con Riverpod
//  Versión del ejemplo de clase adaptada al proyecto VetConnect.
//  Demuestra los mismos conceptos vistos en clase:
//    · ProviderScope + StateProvider (contador de citas activas)
//    · NotifierProvider + lista de mascotas
//    · Provider derivado + búsqueda filtrada
//    · NavigationBar con dos tabs usando Riverpod
//  Ejecutar:  flutter run -t lib/main_mp.dart -d chrome
// ─────────────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

void main() => runApp(const ProviderScope(child: VetConnectRiverpodApp()));

// ─── Modelo ───────────────────────────────────────────────────────────────
class Mascota {
  final String nombre;
  final String especie;
  final String dueno;
  const Mascota(this.nombre, this.especie, this.dueno);
}

// ─── StateProvider: citas activas (contador simple) ───────────────────────
final citasActivasProvider = StateProvider<int>((ref) => 2);

// ─── NotifierProvider: lista de mascotas ──────────────────────────────────
class MascotasNotifier extends Notifier<List<Mascota>> {
  @override
  List<Mascota> build() => const [
        Mascota('Firulais', 'Perro', 'Ana García'),
        Mascota('Michi', 'Gato', 'Luis Pérez'),
        Mascota('Rocky', 'Perro', 'María López'),
        Mascota('Nube', 'Conejo', 'Carlos Ruiz'),
        Mascota('Pelusa', 'Gato', 'Jorge Mora'),
      ];

  void agregar(Mascota m) => state = [...state, m];
}

final mascotasProvider =
    NotifierProvider<MascotasNotifier, List<Mascota>>(MascotasNotifier.new);

// ─── StateProvider: texto de búsqueda ─────────────────────────────────────
final filtroProvider = StateProvider<String>((ref) => '');

// ─── Provider derivado: mascotas filtradas ────────────────────────────────
final mascotasFiltradasProvider = Provider<List<Mascota>>((ref) {
  final filtro = ref.watch(filtroProvider).toLowerCase();
  final mascotas = ref.watch(mascotasProvider);
  if (filtro.isEmpty) return mascotas;
  return mascotas
      .where((m) =>
          m.nombre.toLowerCase().contains(filtro) ||
          m.especie.toLowerCase().contains(filtro) ||
          m.dueno.toLowerCase().contains(filtro))
      .toList();
});

// ─── App raíz ─────────────────────────────────────────────────────────────
class VetConnectRiverpodApp extends StatelessWidget {
  const VetConnectRiverpodApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VetConnect · Riverpod',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00838F)),
          useMaterial3: true,
        ),
        home: const PantallaPrincipal(),
      );
}

// ─── NavigationBar con dos tabs ───────────────────────────────────────────
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});
  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tab == 0 ? const _TabMascotas() : const _TabCitas(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.pets), label: 'Mascotas'),
          NavigationDestination(
              icon: Icon(Icons.event), label: 'Citas'),
        ],
      ),
    );
  }
}

// ─── Tab 1: lista de mascotas + búsqueda (Provider derivado) ──────────────
class _TabMascotas extends ConsumerWidget {
  const _TabMascotas();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mascotas = ref.watch(mascotasFiltradasProvider);
    final total = ref.watch(mascotasProvider).length;

    return Scaffold(
      appBar: AppBar(title: Text('Mascotas ($total)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Buscar mascota...',
              leading: const Icon(Icons.search),
              onChanged: (v) =>
                  ref.read(filtroProvider.notifier).state = v,
            ),
          ),
          Expanded(
            child: mascotas.isEmpty
                ? const Center(child: Text('Sin resultados'))
                : ListView.separated(
                    itemCount: mascotas.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) {
                      final m = mascotas[i];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.pets)),
                        title: Text(m.nombre),
                        subtitle: Text('${m.especie} · ${m.dueno}'),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(mascotasProvider.notifier).agregar(
              Mascota('Nueva ${total + 1}', 'Perro', 'Sin asignar'),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ─── Tab 2: contador de citas activas (StateProvider) ─────────────────────
class _TabCitas extends ConsumerWidget {
  const _TabCitas();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citas = ref.watch(citasActivasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Citas activas')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$citas',
                style: Theme.of(context).textTheme.displayLarge),
            const Text('citas activas hoy'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(citasActivasProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(citasActivasProvider) > 0) {
                ref.read(citasActivasProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
