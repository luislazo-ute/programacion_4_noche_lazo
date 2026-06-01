// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.screens.*
import com.ute.compose.material.*
import com.ute.compose.ui.viewmodel.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // ◀ CAMBIA AQUÍ para probar cada sección:
                //S01SaludoScreen()
                //S02TextScreen()
                //S03ButtonScreen()
                //S04LayoutScreen()
                //S05ModifierScreen()
                //S06EstadoScreen()
                //S07StateHoistingScreen()
                //S08BienvenidaScreen()

                //MATERIA 3 TextField, Card, LazyColumn, Scaffold y diálogos
                // ◀ CAMBIA AQUÍ para probar cada paso:
                Paso01DatosScreen()
                //Paso01AreaTrianScreen()
                //Paso01SumaScreen()
                //Paso01TextFieldScreen()
                //Paso02CardScreen()
                //Paso03LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                //Paso06_DialogosScreen()   // ← paso activo

                //COMPOSE
                // ◀ CAMBIA AQUÍ para probar cada paso:
                //Paso01ViewModelScreen()
                //Paso02UiStateScreen()
                // Paso03_NavigationScreen()
                // Paso04_DetalleScreen()  ← solo para preview, la nav lo llama
                // Paso05_RetrofitScreen()
                //Paso06_CompletoScreen()   // ← paso activo
            }
        }
    }
}