// lib/main_mp.dart
// ─────────────────────────────────────────────────────────────────────────
//  MI PROYECTO · VetConnect — Módulo 06: Widgets
//  Versión del ejemplo de clase adaptada al proyecto VetConnect.
//  Demuestra los mismos conceptos vistos en clase:
//    · StatelessWidget y composición
//    · Widgets básicos (Text, Icon, Image, Container, Card, Chip, ListTile)
//    · Row / Column / layout
//    · StatefulWidget + setState (contador de citas del día)
//  Ejecutar:  flutter run -t lib/main_mp.dart -d chrome
// ─────────────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';

void main() => runApp(const VetConnectWidgetsApp());

class VetConnectWidgetsApp extends StatelessWidget {
  const VetConnectWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VetConnect · Widgets',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00897B)),
          useMaterial3: true,
        ),
        home: const CatalogoVetConnect(),
      );
}

// ─── Pantalla principal: catálogo de widgets básicos (Stateless) ──────────
class CatalogoVetConnect extends StatelessWidget {
  const CatalogoVetConnect({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('VetConnect · Widgets básicos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _Seccion('1 · Text e Icon'),
          _EncabezadoClinica(),
          SizedBox(height: 16),
          _Seccion('2 · Container y Chip (estado de la mascota)'),
          _ChipsEstado(),
          SizedBox(height: 16),
          _Seccion('3 · Card + ListTile (ficha de mascota)'),
          FichaMascota(
            nombre: 'Firulais',
            especie: 'Perro · Labrador',
            dueno: 'Ana García',
            icono: Icons.pets,
          ),
          FichaMascota(
            nombre: 'Michi',
            especie: 'Gato · Siamés',
            dueno: 'Luis Pérez',
            icono: Icons.pets,
          ),
          SizedBox(height: 16),
          _Seccion('4 · StatefulWidget + setState'),
          ContadorCitas(),
        ],
      ),
    );
  }
}

// ─── Widget de composición: título de sección ────────────────────────────
class _Seccion extends StatelessWidget {
  final String texto;
  const _Seccion(this.texto);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}

// ─── Text + Icon en un Row ────────────────────────────────────────────────
class _EncabezadoClinica extends StatelessWidget {
  const _EncabezadoClinica();

  @override
  Widget build(BuildContext context) => Row(
        children: const [
          Icon(Icons.local_hospital, color: Colors.teal, size: 32),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Clínica Veterinaria VetConnect\nAtención de mascotas 24/7',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
}

// ─── Container + Chip: estados de la mascota ──────────────────────────────
class _ChipsEstado extends StatelessWidget {
  const _ChipsEstado();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.teal.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(
              avatar: Icon(Icons.check_circle, color: Colors.green),
              label: Text('Vacunado'),
            ),
            Chip(
              avatar: Icon(Icons.event_available, color: Colors.blue),
              label: Text('Cita agendada'),
            ),
            Chip(
              avatar: Icon(Icons.warning, color: Colors.orange),
              label: Text('Control pendiente'),
            ),
          ],
        ),
      );
}

// ─── Card + ListTile: ficha reutilizable de una mascota ───────────────────
class FichaMascota extends StatelessWidget {
  final String nombre;
  final String especie;
  final String dueno;
  final IconData icono;
  const FichaMascota({
    super.key,
    required this.nombre,
    required this.especie,
    required this.dueno,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Icon(icono)),
          title: Text(nombre),
          subtitle: Text('$especie\nDueño: $dueno'),
          isThreeLine: true,
          trailing: const Icon(Icons.chevron_right),
        ),
      );
}

// ─── StatefulWidget + setState: contador de citas del día ─────────────────
class ContadorCitas extends StatefulWidget {
  const ContadorCitas({super.key});
  @override
  State<ContadorCitas> createState() => _ContadorCitasState();
}

class _ContadorCitasState extends State<ContadorCitas> {
  int _citas = 3;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      color: cs.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Citas agendadas hoy',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('$_citas',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () =>
                      setState(() => _citas = _citas > 0 ? _citas - 1 : 0),
                  icon: const Icon(Icons.remove),
                  label: const Text('Atender'),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: () => setState(() => _citas++),
                  icon: const Icon(Icons.add),
                  label: const Text('Nueva cita'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
