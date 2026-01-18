//
//  MockAuthService.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import Foundation

/// Implementación simulada de `AuthService` para pruebas y desarrollo.
///
/// Para principiantes:
/// - Esta clase no llama a un servidor real; simplemente compara contra valores fijos.
/// - Útil para probar la app sin necesidad de una API.
/// - Credenciales aceptadas: usuario `demo`, contraseña `1234`.
final class MockAuthService: AuthService {
    /// Verifica si las credenciales coinciden con los valores de demostración.
    /// - Parameters:
    ///   - username: Nombre de usuario.
    ///   - password: Contraseña.
    /// - Returns: `true` si coincide con `demo` / `1234`.
    func login(username: String, password: String) -> Bool {
        username.lowercased() == "demo" && password == "1234"
    }
}
