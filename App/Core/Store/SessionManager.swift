//
//  SessionManager.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI
import Combine

/// Administrador de sesión de usuario.
///
/// Para principiantes:
/// - Conforma `ObservableObject`, lo que permite notificar cambios a la UI.
/// - Las propiedades marcadas con `@Published` emiten actualizaciones automáticas cuando cambian.
/// - Este tipo no muestra pantallas; solo gestiona el estado de login y expone métodos para iniciar/cerrar sesión.
final class SessionManager: ObservableObject {
    /// Indica si hay un usuario autenticado actualmente.
    ///
    /// Para principiantes:
    /// - `private(set)` significa que otras piezas de código pueden leer el valor, pero solo esta clase puede cambiarlo.
    /// - La UI puede reaccionar a los cambios de este valor automáticamente.
    @Published private(set) var isLoggedIn: Bool = false

    /// Dependencia que realiza la validación de credenciales (login real o simulado).
    /// Se inyecta por el inicializador para facilitar pruebas.
    private let authService: AuthService

    /// Crea una nueva instancia del administrador de sesión.
    /// - Parameter authService: Servicio que ejecuta la lógica de autenticación.
    ///
    /// Para principiantes: inyectar dependencias hace que el código sea más fácil de probar y mantener.
    init(authService: AuthService) {
        self.authService = authService
    }

    /// Intenta iniciar sesión con las credenciales proporcionadas.
    /// - Parameters:
    ///   - username: Nombre de usuario.
    ///   - password: Contraseña.
    /// - Returns: `true` si la autenticación fue exitosa; de lo contrario, `false`.
    ///
    /// Nota: Actualiza `isLoggedIn` a `true` cuando las credenciales son correctas.
    func signIn(username: String, password: String) -> Bool {
        let ok = authService.login(username: username, password: password)
        if ok { isLoggedIn = true }
        return ok
    }

    /// Cierra la sesión actual.
    ///
    /// Para principiantes: restablece `isLoggedIn` a `false` y la UI volverá a mostrar la pantalla de login.
    func signOut() {
        isLoggedIn = false
    }
}
