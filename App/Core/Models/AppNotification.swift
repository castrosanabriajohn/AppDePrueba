//
//  AppNotification.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import Foundation

/// Modelo de datos para una notificación dentro de la app.
///
/// Para principiantes:
/// - `title` y `message` contienen el contenido mostrado al usuario.
/// - `isRead` indica si ya fue leída.
/// - `date` ayuda a ordenar las notificaciones por recencia.
struct AppNotification: Identifiable, Equatable {
    /// Identificador único de la notificación.
    let id: UUID
    /// Título de la notificación.
    var title: String
    /// Mensaje o descripción de la notificación.
    var message: String
    /// Indica si la notificación ya fue leída.
    var isRead: Bool
    /// Fecha y hora en que se generó la notificación.
    var date: Date
}

