// lib/main_mp.dart
// ─────────────────────────────────────────────────────────────────────────
//  MI PROYECTO · VetConnect — Módulo 09: Formularios y listas
//  Versión del ejemplo de clase adaptada al proyecto VetConnect.
//  Demuestra los mismos conceptos vistos en clase:
//    · Form + TextFormField + validación
//    · Modelo (Mascota) + ListView.builder
//    · GridView.builder + toggle lista/grid
//    · SearchBar + filtrado en tiempo real
//  Ejecutar:  flutter run -t lib/main_mp.dart -d chrome
// ─────────────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';

void main() => runApp(const VetConnectFormsApp());

class VetConnectFormsApp extends StatelessWidget {
  const VetConnectFormsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VetConnect · Formularios',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
          useMaterial3: true,
        ),
        home: const PantallaMascotas(),
      );
}

// ─── Modelo del proyecto ──────────────────────────────────────────────────
class Mascota {
  final String nombre;
  final String especie;
  final String dueno;
  final int edad;
  bool favorito;
  Mascota({
    required this.nombre,
    required this.especie,
    required this.dueno,
    required this.edad,
    this.favorito = false,
  });
}

// ─── Pantalla principal: lista/grid + búsqueda + alta por formulario ──────
class PantallaMascotas extends StatefulWidget {
  const PantallaMascotas({super.key});
  @override
  State<PantallaMascotas> createState() => _PantallaMascotasState();
}

class _PantallaMascotasState extends State<PantallaMascotas> {
  final List<Mascota> _mascotas = [
    Mascota(nombre: 'Firulais', especie: 'Perro', dueno: 'Ana García', edad: 3, favorito: true),
    Mascota(nombre: 'Michi', especie: 'Gato', dueno: 'Luis Pérez', edad: 2),
    Mascota(nombre: 'Rocky', especie: 'Perro', dueno: 'María López', edad: 5),
    Mascota(nombre: 'Nube', especie: 'Conejo', dueno: 'Carlos Ruiz', edad: 1),
    Mascota(nombre: 'Toby', especie: 'Perro', dueno: 'Sofía Díaz', edad: 4),
    Mascota(nombre: 'Pelusa', especie: 'Gato', dueno: 'Jorge Mora', edad: 6),
  ];

  String _filtro = '';
  bool _grid = false;

  List<Mascota> get _filtradas {
    if (_filtro.isEmpty) return _mascotas;
    final q = _filtro.toLowerCase();
    return _mascotas
        .where((m) =>
            m.nombre.toLowerCase().contains(q) ||
            m.especie.toLowerCase().contains(q) ||
            m.dueno.toLowerCase().contains(q))
        .toList();
  }

  IconData _iconoEspecie(String especie) => switch (especie) {
        'Perro' => Icons.pets,
        'Gato' => Icons.emoji_nature,
        'Conejo' => Icons.cruelty_free,
        _ => Icons.pets,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final lista = _filtradas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas (${lista.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            tooltip: _grid ? 'Ver como lista' : 'Ver como cuadrícula',
            icon: Icon(_grid ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _grid = !_grid),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Buscar por nombre, especie o dueño...',
              leading: const Icon(Icons.search),
              onChanged: (v) => setState(() => _filtro = v),
            ),
          ),
          Expanded(
            child: lista.isEmpty
                ? const Center(child: Text('Sin resultados'))
                : _grid
                    ? _VistaGrid(mascotas: lista, iconoEspecie: _iconoEspecie)
                    : _VistaLista(
                        mascotas: lista,
                        iconoEspecie: _iconoEspecie,
                        onFav: (m) => setState(() => m.favorito = !m.favorito),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirFormulario,
        icon: const Icon(Icons.add),
        label: const Text('Registrar'),
      ),
    );
  }

  Future<void> _abrirFormulario() async {
    final nueva = await showModalBottomSheet<Mascota>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _FormularioMascota(),
    );
    if (nueva != null) setState(() => _mascotas.add(nueva));
  }
}

// ─── ListView.builder ─────────────────────────────────────────────────────
class _VistaLista extends StatelessWidget {
  final List<Mascota> mascotas;
  final IconData Function(String) iconoEspecie;
  final void Function(Mascota) onFav;
  const _VistaLista({
    required this.mascotas,
    required this.iconoEspecie,
    required this.onFav,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: mascotas.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, i) {
          final m = mascotas[i];
          return ListTile(
            leading: CircleAvatar(child: Icon(iconoEspecie(m.especie))),
            title: Text(m.nombre),
            subtitle: Text('${m.especie} · ${m.edad} años · ${m.dueno}'),
            trailing: IconButton(
              icon: Icon(m.favorito ? Icons.favorite : Icons.favorite_border,
                  color: m.favorito ? Colors.red : null),
              onPressed: () => onFav(m),
            ),
          );
        },
      );
}

// ─── GridView.builder ─────────────────────────────────────────────────────
class _VistaGrid extends StatelessWidget {
  final List<Mascota> mascotas;
  final IconData Function(String) iconoEspecie;
  const _VistaGrid({required this.mascotas, required this.iconoEspecie});

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: mascotas.length,
        itemBuilder: (_, i) {
          final m = mascotas[i];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 26, child: Icon(iconoEspecie(m.especie))),
                  const SizedBox(height: 8),
                  Text(m.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('${m.especie} · ${m.edad} años'),
                  Text(m.dueno, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      );
}

// ─── Form + TextFormField + validación ────────────────────────────────────
class _FormularioMascota extends StatefulWidget {
  const _FormularioMascota();
  @override
  State<_FormularioMascota> createState() => _FormularioMascotaState();
}

class _FormularioMascotaState extends State<_FormularioMascota> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _dueno = TextEditingController();
  final _edad = TextEditingController();
  String _especie = 'Perro';

  @override
  void dispose() {
    _nombre.dispose();
    _dueno.dispose();
    _edad.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      Mascota(
        nombre: _nombre.text.trim(),
        especie: _especie,
        dueno: _dueno.text.trim(),
        edad: int.tryParse(_edad.text) ?? 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Registrar mascota',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nombre,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.pets),
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Ingresa el nombre' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _especie,
              decoration: const InputDecoration(
                labelText: 'Especie',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Perro', child: Text('Perro')),
                DropdownMenuItem(value: 'Gato', child: Text('Gato')),
                DropdownMenuItem(value: 'Conejo', child: Text('Conejo')),
              ],
              onChanged: (v) => setState(() => _especie = v ?? 'Perro'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _dueno,
              decoration: const InputDecoration(
                labelText: 'Dueño',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Ingresa el dueño' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _edad,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Edad (años)',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final n = int.tryParse(v ?? '');
                if (n == null || n < 0) return 'Edad inválida';
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _guardar,
              icon: const Icon(Icons.save),
              label: const Text('Guardar mascota'),
            ),
          ],
        ),
      ),
    );
  }
}
