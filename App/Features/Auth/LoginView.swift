//
//  LoginView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla de inicio de sesión (login) para la aplicación.
///
/// Para principiantes:
/// - Contiene campos de texto para el usuario y la contraseña.
/// - Usa `SessionManager` (inyectado como `@EnvironmentObject`) para validar credenciales.
/// - Muestra un mensaje de error cuando el login falla.
/// - `NavigationStack` envuelve el contenido para ofrecer barra de navegación si se necesitara en el futuro.
struct LoginView: View {
    /// Referencia al gestor de sesión compartido. Aquí se llama a `signIn`.
    @EnvironmentObject private var session: SessionManager

    /// Nombre de usuario escrito por la persona usuaria.
    ///
    /// Nota: `@State` guarda el valor localmente dentro de esta vista.
    @State private var username: String = ""
    /// Contraseña escrita por la persona usuaria.
    ///
    /// Se oculta en la UI gracias a `SecureField`.
    @State private var password: String = ""
    /// Mensaje de error a mostrar cuando la autenticación falla.
    /// Es opcional: no existe cuando no hay error.
    @State private var errorMessage: String?

    /// Cuerpo de la vista.
    /// - Returns: Interfaz de login con campos, botón de ingreso y validación simple.
    ///
    /// Explicación para principiantes:
    /// - `TextField` y `SecureField` capturan el texto del usuario.
    /// - El botón llama a `session.signIn(...)` y, si no es correcto, se establece `errorMessage`.
    /// - `.navigationBarHidden(true)` oculta la barra de navegación en esta pantalla.
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer()

                VStack(spacing: 8) {
                    Text("Login")
                        .font(.largeTitle.bold())
                    Text("Simulado: user = demo, pass = 1234")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 12) {
                    TextField("Usuario", text: $username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)

                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(.roundedBorder)

                    // Muestra el mensaje de error si existe.
                    if let errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                            .font(.footnote)
                    }

                    // Al tocar este botón se intenta autenticar al usuario con las credenciales ingresadas.
                    // Botón que intenta iniciar sesión con las credenciales proporcionadas.
                    Button {
                        errorMessage = nil
                        let ok = session.signIn(username: username, password: password)
                        if !ok {
                            errorMessage = "Credenciales inválidas. Prueba demo / 1234."
                        }
                    } label: {
                        Text("Ingresar")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

