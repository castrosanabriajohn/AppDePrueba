//
//  HomeView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla de inicio (Home) de la aplicación.
///
/// Para principiantes:
/// - Muestra un saludo con el nombre del usuario.
/// - Presenta un resumen de tareas pendientes y notificaciones sin leer.
/// - Incluye una lista de las últimas tareas y una acción rápida para crear una tarea de demostración.
struct HomeView: View {
    /// `AppStore` compartido con datos globales como usuario, tareas y notificaciones.
    @EnvironmentObject private var store: AppStore

    /// Cuerpo de la vista.
    /// - Returns: Lista con secciones de saludo, resumen, últimas tareas y acciones rápidas.
    ///
    /// Notas:
    /// - `Section` ayuda a agrupar elementos con encabezados y estilos propios de listas.
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hola, \(store.currentUser.fullName)")
                        .font(.title2.bold())
                    Text("Resumen rápido de tu app de prueba.")
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 6)
            }

            /*
             Sección de resumen:
             - Muestra contadores de tareas pendientes y notificaciones sin leer.
             - Útil para que el usuario vea rápidamente el estado de su app.
            */
            Section("Resumen") {
                HStack {
                    Label("Pendientes", systemImage: "checklist")
                    Spacer()
                    Text("\(store.pendingTasksCount)")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Label("Notificaciones", systemImage: "bell")
                    Spacer()
                    Text("\(store.unreadNotificationsCount) sin leer")
                        .foregroundStyle(.secondary)
                }
            }

            /*
             Sección de últimas tareas:
             - Muestra algunas de las tareas más recientes.
             - El ícono cambia según si la tarea está completada o no.
            */
            Section("Últimas tareas") {
                ForEach(store.tasks.prefix(3)) { t in
                    HStack {
                        Image(systemName: t.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(t.isDone ? .green : .secondary)
                        Text(t.title)
                    }
                }
            }

            /*
             Sección de acciones rápidas:
             - Incluye un botón para crear una tarea de demostración.
             - Ideal para probar la interacción sin navegar a la pestaña de Tareas.
            */
            Section("Acciones rápidas") {
                Button("Crear tarea (demo)") {
                    store.tasks.insert(
                        TaskItem(id: UUID(), title: "Nueva tarea creada desde Home", isDone: false, createdAt: Date()),
                        at: 0
                    )
                }
            }
        }
        .navigationTitle("Home")
    }
}

