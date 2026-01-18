//
//  RootView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Vista raíz que decide qué mostrar según el estado de sesión.
///
/// Para principiantes:
/// - `Group` es un contenedor que permite agrupar vistas sin afectar el layout.
/// - Si `session.isLoggedIn` es verdadero, se muestra la aplicación principal (`MainTabView`).
///   Si es falso, se muestra la pantalla de inicio de sesión (`LoginView`).
/// - Este patrón se conoce como "root routing" o enrutamiento raíz.
struct RootView: View {
    /// Gestor de sesión compartido, usado para saber si el usuario está autenticado.
    @EnvironmentObject private var session: SessionManager

    /// Cuerpo de la vista.
    /// - Returns: Una vista que alterna entre `MainTabView` y `LoginView` según el estado de sesión.
    var body: some View {
        Group {
            if session.isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

