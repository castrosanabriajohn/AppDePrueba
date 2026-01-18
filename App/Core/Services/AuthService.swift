//
//  AuthService.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import Foundation

/// Protocolo que define la interfaz de autenticación.
///
/// Para principiantes:
/// - Un protocolo describe qué métodos debe implementar un tipo.
/// - Permite cambiar la implementación (por ejemplo, `MockAuthService` para pruebas
///   y otra implementación real para producción) sin cambiar el resto del código.
protocol AuthService {
    /// Intenta autenticar a un usuario con nombre y contraseña.
    /// - Parameters:
    ///   - username: Nombre de usuario.
    ///   - password: Contraseña.
    /// - Returns: `true` si las credenciales son válidas; en caso contrario `false`.
    func login(username: String, password: String) -> Bool
}
