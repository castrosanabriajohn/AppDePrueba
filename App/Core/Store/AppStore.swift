//
//  AppStore.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI
import Combine

/// Almacén de estado global (Store) basado en `ObservableObject`.
///
/// Para principiantes:
/// - Guarda datos que muchas vistas necesitan (usuario, tareas, notificaciones).
/// - Las propiedades marcadas con `@Published` notifican cambios a la UI automáticamente.
/// - Este patrón centraliza el estado para que sea más fácil de leer y modificar desde distintas vistas.
final class AppStore: ObservableObject {
    /// Usuario en contexto de la app (nombre y correo). Se puede editar desde `ProfileView`.
    @Published var currentUser: User = User(id: UUID(), fullName: "Demo User", email: "demo@correo.com")

    /// Lista de tareas visibles en la app. Se modifica en `TasksView` y `AddTaskView`.
    @Published var tasks: [TaskItem] = [
        TaskItem(id: UUID(), title: "Revisar tablero", isDone: false, createdAt: Date())
    ]

    /// Lista de notificaciones que se muestran en `NotificationsView`.
    @Published var notifications: [AppNotification] = [
        AppNotification(id: UUID(), title: "Bienvenido", message: "Tu app de prueba está lista.", isRead: false, date: Date())
    ]

    /// Cantidad de notificaciones sin leer (se usa para mostrar la insignia en la pestaña de Notificaciones).
    var unreadNotificationsCount: Int { notifications.filter { !$0.isRead }.count }
    /// Cantidad de tareas no completadas (se muestra como resumen en `HomeView`).
    var pendingTasksCount: Int { tasks.filter { !$0.isDone }.count }
}

