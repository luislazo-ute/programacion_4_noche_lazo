// hooks/useCitaSimulada.ts
// ─────────────────────────────────────────────────────────────────────────
//  MI PROYECTO · VetConnect — Custom hook
//  Versión del ejemplo de clase (useConexionSimulada) adaptada a VetConnect.
//  Simula el agendamiento de una cita veterinaria con estados y reintentos.
// ─────────────────────────────────────────────────────────────────────────
import { useState, useEffect, useCallback } from 'react'

type EstadoCita = 'sin_agendar' | 'agendando' | 'confirmada' | 'sin_cupo'

interface ResultadoCita {
  estado: EstadoCita
  intentos: number
  horaAsignada: string | null
  agendar: () => void
  reiniciar: () => void
}

export function useCitaSimulada(mascota: string): ResultadoCita {
  const [estado, setEstado] = useState<EstadoCita>('sin_agendar')
  const [intentos, setIntentos] = useState<number>(0)
  const [horaAsignada, setHoraAsignada] = useState<string | null>(null)
  const [disparador, setDisparador] = useState<number>(0) // fuerza re-ejecución del efecto

  useEffect(() => {
    if (estado !== 'agendando') return

    const timeout = setTimeout(() => {
      const sinCupo = Math.random() < 0.35 // 35 % de probabilidad de no haber cupo
      setIntentos(n => n + 1)

      if (sinCupo) {
        setEstado('sin_cupo')
        setHoraAsignada(null)
      } else {
        const hora = 8 + Math.floor(Math.random() * 9) // entre 08:00 y 16:00
        const min = Math.random() < 0.5 ? '00' : '30'
        setHoraAsignada(`${hora.toString().padStart(2, '0')}:${min}`)
        setEstado('confirmada')
      }
    }, 1200)

    return () => clearTimeout(timeout)
  }, [estado, disparador])

  const agendar = useCallback(() => {
    setEstado('agendando')
    setDisparador(d => d + 1) // garantiza que el efecto se re-ejecute
  }, [])

  const reiniciar = useCallback(() => {
    setEstado('sin_agendar')
    setIntentos(0)
    setHoraAsignada(null)
  }, [])

  return { estado, intentos, horaAsignada, agendar, reiniciar }
}
