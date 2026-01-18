//
//  AddTaskView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla para crear una nueva tarea.
///
/// Para principiantes:
/// - Usa un `Form` para pedir el título de la tarea.
/// - Presenta la vista dentro de un `NavigationStack` para mostrar acciones en la barra superior.
/// - Al guardar, inserta la tarea en el `AppStore` y cierra la hoja.
struct AddTaskView: View {
    /// Acción del entorno para cerrar esta vista modal.
    ///
    /// `dismiss()` se llama cuando el usuario cancela o cuando se guarda la tarea.
    @Environment(\.dismiss) private var dismiss
    /// Acceso al `AppStore` para añadir la nueva tarea a la lista compartida.
    @EnvironmentObject private var store: AppStore

    /// Título de la nueva tarea escrito por el usuario.
    ///
    /// Validación mínima: no se permite guardar si el título está vacío.
    @State private var title: String = ""

    /// Cuerpo de la vista.
    /// - Returns: Un formulario de creación de tareas dentro de un `NavigationStack`.
    var body: some View {
        NavigationStack {
            Form {
                Section("Nueva tarea") {
                    TextField("Título", text: $title)
                }
            }
            .navigationTitle("Agregar")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    /*
                     Acción de Guardar:
                     - Verifica que el título no esté vacío.
                     - Crea una nueva `TaskItem` y la inserta al inicio de la lista.
                     - Cierra la vista modal llamando a `dismiss()`.
                    */
                    Button("Guardar") {
                        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                        store.tasks.insert(
                            TaskItem(id: UUID(), title: title, isDone: false, createdAt: Date()),
                            at: 0
                        )
                        dismiss()
                    }
                }
            }
        }
    }
}

