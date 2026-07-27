// app/mp.tsx  ·  ruta /mp
// ─────────────────────────────────────────────────────────────────────────
//  MI PROYECTO · VetConnect — Módulo 04: React Hooks
//  Versión del ejemplo de clase adaptada al proyecto VetConnect.
//  Demuestra los mismos conceptos vistos en clase:
//    · useState              → mascotas en sala de espera
//    · useEffect + setInterval → reloj de la recepción
//    · useRef                → foco en TextInput + contador silencioso
//    · Hooks nativos de RN   → useWindowDimensions
//    · Custom hook           → useCitaSimulada (agendar cita)
//  Ejecutar:  npm run web   (y navegar a /mp)
// ─────────────────────────────────────────────────────────────────────────
import { useRef, useState, useEffect } from 'react'
import {
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
  Pressable,
  useWindowDimensions,
  TextInput as RNTextInput,
} from 'react-native'
import { useCitaSimulada } from './hooks/useCitaSimulada'

export default function VetConnectHooks() {
  // ── useState: mascotas en sala de espera ─────────────────────────────
  const [enEspera, setEnEspera] = useState<number>(2)

  // ── useEffect + setInterval: reloj de recepción ──────────────────────
  const [hora, setHora] = useState<string>(new Date().toLocaleTimeString())
  useEffect(() => {
    const id = setInterval(() => setHora(new Date().toLocaleTimeString()), 1000)
    return () => clearInterval(id) // limpieza al desmontar
  }, [])

  // ── useRef: foco en input + contador silencioso (sin re-render) ──────
  const inputRef = useRef<RNTextInput>(null)
  const registrosSilenciosos = useRef<number>(0)
  const [mascota, setMascota] = useState<string>('')
  const [ultimoRegistro, setUltimoRegistro] = useState<string>('—')
  useEffect(() => {
    inputRef.current?.focus()
  }, [])

  function registrarMascota() {
    registrosSilenciosos.current += 1 // muta sin re-render
    setUltimoRegistro(
      `${mascota || 'mascota'} — registro #${registrosSilenciosos.current}`,
    )
  }

  // ── Hook nativo de RN: dimensiones de la ventana ─────────────────────
  const { width } = useWindowDimensions()

  // ── Custom hook: agendar cita ────────────────────────────────────────
  const cita = useCitaSimulada('Firulais')
  const colorEstado: Record<string, string> = {
    sin_agendar: '#607d8b',
    agendando: '#f9a825',
    confirmada: '#2e7d32',
    sin_cupo: '#c62828',
  }

  return (
    <ScrollView contentContainerStyle={styles.contenedor}>
      <Text style={styles.h1}>🐾 VetConnect · Recepción</Text>

      {/* useEffect */}
      <View style={styles.tarjeta}>
        <Text style={styles.h2}>useEffect · Reloj de recepción</Text>
        <Text style={styles.reloj}>{hora}</Text>
      </View>

      {/* useState */}
      <View style={styles.tarjeta}>
        <Text style={styles.h2}>useState · Mascotas en sala de espera</Text>
        <Text style={styles.numero}>{enEspera}</Text>
        <View style={styles.fila}>
          <Pressable
            style={[styles.boton, { backgroundColor: '#00695c' }]}
            onPress={() => setEnEspera(n => n + 1)}
          >
            <Text style={styles.textoBoton}>+ Llega mascota</Text>
          </Pressable>
          <Pressable
            style={[styles.boton, styles.botonSec]}
            onPress={() => setEnEspera(n => (n > 0 ? n - 1 : 0))}
          >
            <Text style={styles.textoBotonSec}>Atender</Text>
          </Pressable>
        </View>
      </View>

      {/* useRef */}
      <View style={styles.tarjeta}>
        <Text style={styles.h2}>useRef · Registro rápido</Text>
        <TextInput
          ref={inputRef}
          style={styles.input}
          value={mascota}
          onChangeText={setMascota}
          placeholder="Nombre de la mascota"
          placeholderTextColor="#aaa"
        />
        <Pressable
          style={[styles.boton, { backgroundColor: '#00695c' }]}
          onPress={registrarMascota}
        >
          <Text style={styles.textoBoton}>Registrar</Text>
        </Pressable>
        <Text style={styles.detalle}>Último: {ultimoRegistro}</Text>
        <Text style={styles.detalle}>
          (los registros silenciosos con useRef no re-renderizan)
        </Text>
      </View>

      {/* Custom hook */}
      <View style={styles.tarjeta}>
        <Text style={styles.h2}>Custom hook · useCitaSimulada</Text>
        <Text style={[styles.estado, { color: colorEstado[cita.estado] }]}>
          Estado: {cita.estado.replace('_', ' ')}
        </Text>
        <Text style={styles.detalle}>Intentos: {cita.intentos}</Text>
        <Text style={styles.detalle}>
          Hora asignada: {cita.horaAsignada ?? '—'}
        </Text>
        <View style={styles.fila}>
          <Pressable
            style={[styles.boton, { backgroundColor: '#00838f' }]}
            onPress={cita.agendar}
          >
            <Text style={styles.textoBoton}>Agendar cita</Text>
          </Pressable>
          <Pressable
            style={[styles.boton, styles.botonSec]}
            onPress={cita.reiniciar}
          >
            <Text style={styles.textoBotonSec}>Reiniciar</Text>
          </Pressable>
        </View>
      </View>

      {/* Hook nativo RN */}
      <View style={styles.tarjeta}>
        <Text style={styles.h2}>Hook nativo RN · useWindowDimensions</Text>
        <Text style={styles.detalle}>Ancho de pantalla: {Math.round(width)} px</Text>
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    padding: 16,
    gap: 14,
    backgroundColor: '#e0f2f1',
    minHeight: '100%',
  },
  h1: {
    fontSize: 22,
    fontWeight: '800',
    color: '#00695c',
    textAlign: 'center',
    marginTop: 8,
  },
  h2: { fontSize: 15, fontWeight: '700', color: '#004d40', marginBottom: 8 },
  tarjeta: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    gap: 8,
    borderWidth: 1,
    borderColor: '#b2dfdb',
  },
  reloj: { fontSize: 30, fontWeight: '700', color: '#00695c', textAlign: 'center' },
  numero: { fontSize: 40, fontWeight: '800', color: '#00695c', textAlign: 'center' },
  fila: { flexDirection: 'row', gap: 10, justifyContent: 'center' },
  boton: { paddingVertical: 12, paddingHorizontal: 16, borderRadius: 8, alignItems: 'center' },
  botonSec: { backgroundColor: '#e0f2f1', borderWidth: 1, borderColor: '#00695c' },
  textoBoton: { color: '#fff', fontWeight: '700' },
  textoBotonSec: { color: '#00695c', fontWeight: '700' },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 6,
    paddingVertical: 10,
    paddingHorizontal: 12,
    backgroundColor: '#fff',
    color: '#000',
  },
  estado: { fontSize: 16, fontWeight: '700' },
  detalle: { fontSize: 13, color: '#555' },
})
