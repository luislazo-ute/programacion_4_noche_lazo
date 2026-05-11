package com.ute.compose.material

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Calculate
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun Paso01AreaTrianScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),

        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            text = "Paso 1 · Área del Triángulo",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        DemoAreaTriangulo()
    }
}

// ─────────────────────────────────────────────
// Área del triángulo
// Fórmula: (base * altura) / 2
// ─────────────────────────────────────────────

@Composable
private fun DemoAreaTriangulo() {

    var base by remember { mutableStateOf("") }
    var altura by remember { mutableStateOf("") }
    var resultado by remember { mutableStateOf("") }

    // Validaciones
    val baseValida = base.toDoubleOrNull() != null
    val alturaValida = altura.toDoubleOrNull() != null

    val formularioValido = baseValida && alturaValida

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Calcular Área del Triángulo",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Campo Base
        OutlinedTextField(
            value = base,

            onValueChange = {
                base = it
            },

            label = {
                Text("Base")
            },

            placeholder = {
                Text("Ej: 10")
            },

            leadingIcon = {
                Icon(Icons.Default.Calculate, contentDescription = null)
            },

            isError = base.isNotEmpty() && !baseValida,

            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),

            singleLine = true,

            modifier = Modifier.fillMaxWidth()
        )

        // Campo Altura
        OutlinedTextField(
            value = altura,

            onValueChange = {
                altura = it
            },

            label = {
                Text("Altura")
            },

            placeholder = {
                Text("Ej: 20")
            },

            leadingIcon = {
                Icon(Icons.Default.Calculate, contentDescription = null)
            },

            isError = altura.isNotEmpty() && !alturaValida,

            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),

            singleLine = true,

            modifier = Modifier.fillMaxWidth()
        )

        // Botón calcular
        Button(
            onClick = {

                val b = base.toDoubleOrNull() ?: 0.0
                val h = altura.toDoubleOrNull() ?: 0.0

                val area = (b * h) / 2

                resultado = area.toString()
            },

            enabled = formularioValido,

            modifier = Modifier.fillMaxWidth()
        ) {

            Icon(
                Icons.Default.Calculate,
                contentDescription = null
            )

            Spacer(modifier = Modifier.width(8.dp))

            Text("Calcular Área")
        }

        // Resultado
        if (resultado.isNotEmpty()) {

            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                ),

                modifier = Modifier.fillMaxWidth()
            ) {

                Box(
                    modifier = Modifier.padding(16.dp),

                    contentAlignment = Alignment.Center
                ) {

                    Text(
                        text = "Área = $resultado",

                        style = MaterialTheme.typography.headlineSmall,

                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
        }
    }
}

// ─────────────────────────────────────────────

@Preview(showBackground = true)
@Composable
fun Paso01AreaTrianguloPreview() {

    MaterialTheme {

        Paso01AreaTrianScreen()
    }
}