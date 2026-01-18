//
//  SettingsView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla de configuración con preferencias y acciones de cuenta.
///
/// Para principiantes:
/// - Usa `Form` para organizar toggles (interruptores) y botones.
/// - Incluye un ejemplo de cierre de sesión usando `SessionManager`.
struct SettingsView: View {
    /// Gestor de sesión compartido, usado aquí para cerrar sesión.
    @EnvironmentObject private var session: SessionManager

    /// Preferencia de ejemplo para activar/desactivar notificaciones push.
    /// Solo afecta a la UI de demostración.
    @State private var pushEnabled: Bool = true
    /// Preferencia de ejemplo para alternar el modo oscuro.
    /// No cambia el tema del sistema; es un estado local de demostración.
    @State private var darkMode: Bool = false

    /// Cuerpo de la vista.
    /// - Returns: Un `Form` con secciones de preferencias y cuenta.
    var body: some View {
        Form {
            Section("Preferencias") {
                Toggle("Notificaciones push", isOn: $pushEnabled)
                Toggle("Modo oscuro (demo)", isOn: $darkMode)
            }

            Section("Cuenta") {
                Button(role: .destructive) {
                    session.signOut()
                } label: {
                    Text("Cerrar sesión")
                }
            }
        }
        .navigationTitle("Configuración")
    }
}
