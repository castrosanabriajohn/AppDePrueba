//
//  ProfileView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla de perfil del usuario.
///
/// Para principiantes:
/// - Permite ver y editar el nombre y el correo del usuario.
/// - Usa un `Form`, ideal para pantallas con campos de entrada.
/// - El botón alterna entre modo edición y guardado.
struct ProfileView: View {
    /// `AppStore` global para leer y actualizar los datos del usuario actual.
    @EnvironmentObject private var store: AppStore

    /// Campo local para el nombre completo.
    /// Se inicializa con el valor del `store` al aparecer la vista.
    @State private var fullName: String = ""
    /// Campo local para el correo electrónico.
    /// También se sincroniza desde el `store` en `onAppear`.
    @State private var email: String = ""
    /// Indica si el formulario está en modo edición (true) o solo lectura (false).
    @State private var isEditing: Bool = false

    /// Cuerpo de la vista.
    /// - Returns: Un `Form` con secciones de perfil y un botón para editar/guardar.
    ///
    /// Para principiantes: `Form` organiza los controles con estilo de ajustes.
    var body: some View {
        Form {
            Section("Perfil") {
                TextField("Nombre", text: $fullName)
                    .disabled(!isEditing)

                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .disabled(!isEditing)
            }

            Section {
                Button(isEditing ? "Guardar" : "Editar") {
                    if isEditing {
                        store.currentUser.fullName = fullName
                        store.currentUser.email = email
                    }
                    isEditing.toggle()
                }
            }
        }
        .navigationTitle("Mis Datos")
        // Al aparecer la vista, copiamos los datos del usuario del `store` a los estados locales.
        // Esto permite editar sin modificar el `store` hasta que se presione "Guardar".
        .onAppear {
            fullName = store.currentUser.fullName
            email = store.currentUser.email
        }
    }
}

