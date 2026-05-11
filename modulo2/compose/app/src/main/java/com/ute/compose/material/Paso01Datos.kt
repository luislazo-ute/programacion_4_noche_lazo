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
fun Paso01DatosScreen() {

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),

        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            text = "Paso 1 · Datos para compra",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        DemoDatosCompra()
    }
}

// ─────────────────────────────────────────────
// Compra con descuento
// Datos:
// Nombre del producto
// Cantidad comprada
// Precio unitario
// ─────────────────────────────────────────────

@Composable
private fun DemoDatosCompra() {

    var producto by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("") }
    var precio by remember { mutableStateOf("") }
    var resultado by remember { mutableStateOf("") }


    val productoValido = producto.isNotEmpty()
    val cantidadValida = cantidad.toDoubleOrNull() != null
    val precioValido = precio.toDoubleOrNull() != null

    val formularioValido = productoValido && cantidadValida && precioValido

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Calcular compra con descuento",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )


        OutlinedTextField(
            value = producto,

            onValueChange = {
                producto = it
            },

            label = {
                Text("Nombre del producto")
            },

            placeholder = {
                Text("Ej: Cuaderno")
            },

            singleLine = true,

            modifier = Modifier.fillMaxWidth()
        )


        OutlinedTextField(
            value = cantidad,

            onValueChange = {
                cantidad = it
            },

            label = {
                Text("Cantidad comprada")
            },

            placeholder = {
                Text("Ej: 10")
            },

            leadingIcon = {
                Icon(Icons.Default.Calculate, contentDescription = null)
            },

            isError = cantidad.isNotEmpty() && !cantidadValida,

            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),

            singleLine = true,

            modifier = Modifier.fillMaxWidth()
        )


        OutlinedTextField(
            value = precio,

            onValueChange = {
                precio = it
            },

            label = {
                Text("Precio unitario")
            },

            placeholder = {
                Text("Ej: 3")
            },

            leadingIcon = {
                Icon(Icons.Default.Calculate, contentDescription = null)
            },

            isError = precio.isNotEmpty() && !precioValido,

            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),

            singleLine = true,

            modifier = Modifier.fillMaxWidth()
        )


        Button(
            onClick = {

                val cant = cantidad.toDoubleOrNull() ?: 0.0
                val pre = precio.toDoubleOrNull() ?: 0.0

                val subtotal = cant * pre

                var descuento = 0.0

                if (subtotal > 50) {
                    descuento = subtotal * 0.10
                } else if (subtotal >= 20) {
                    descuento = subtotal * 0.05
                } else {
                    descuento = 0.0
                }

                val total = subtotal - descuento

                resultado =
                    "Producto: $producto\n" +
                            "Subtotal: $subtotal\n" +
                            "Descuento aplicado: $descuento\n" +
                            "Total a pagar: $total"
            },

            enabled = formularioValido,

            modifier = Modifier.fillMaxWidth()
        ) {

            Icon(
                Icons.Default.Calculate,
                contentDescription = null
            )

            Spacer(modifier = Modifier.width(8.dp))

            Text("Calcular")
        }


        if (resultado.isNotEmpty()) {

            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                ),

                modifier = Modifier.fillMaxWidth()
            ) {

                Box(
                    modifier = Modifier.padding(16.dp),

                    contentAlignment = Alignment.CenterStart
                ) {

                    Text(
                        text = resultado,

                        style = MaterialTheme.typography.bodyLarge,

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
fun Paso01DatosPreview() {

    MaterialTheme {

        Paso01DatosScreen()
    }
}