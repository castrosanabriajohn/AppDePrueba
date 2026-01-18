//
//  User.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import Foundation

/// Modelo de datos para representar a una persona usuaria.
///
/// Para principiantes:
/// - Conforma `Identifiable` para poder usarlo fácilmente en listas (`List`).
/// - Conforma `Equatable` para compararlo (útil en pruebas y actualizaciones).
/// - `UUID` es un identificador único universal.
struct User: Identifiable, Equatable {
    /// Identificador único del usuario.
    let id: UUID
    /// Nombre completo del usuario.
    var fullName: String
    /// Correo electrónico del usuario.
    var email: String
}
