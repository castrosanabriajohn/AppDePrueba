//
//  TaskItem.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import Foundation

/// Modelo de datos que representa una tarea.
///
/// Para principiantes:
/// - `Identifiable` permite mostrar tareas en `List` sin esfuerzo.
/// - `Equatable` ayuda a comparar y actualizar tareas.
/// - `createdAt` guarda la fecha de creación.
struct TaskItem: Identifiable, Equatable {
    /// Identificador único de la tarea.
    let id: UUID
    /// Título o descripción breve de la tarea.
    var title: String
    /// Indica si la tarea está completada.
    var isDone: Bool
    /// Fecha y hora en que se creó la tarea.
    var createdAt: Date
}

