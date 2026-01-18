//
//  TasksView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Vista de lista de tareas.
///
/// Para principiantes:
/// - `List` crea una lista desplazable.
/// - `ForEach` recorre elementos para mostrarlos como filas.
/// - Los modificadores `.onDelete` y botones permiten editar la lista (eliminar, marcar como hecho).
/// - Un `sheet` presenta otra vista de forma modal para crear nuevas tareas.
struct TasksView: View {
    /// Accede al `AppStore` para leer y modificar la lista de tareas.
    @EnvironmentObject private var store: AppStore
    /// Controla si se muestra la hoja para agregar una nueva tarea.
    @State private var showAdd: Bool = false

    /// Cuerpo de la vista.
    /// - Returns: Una lista de tareas con opciones para marcar, eliminar y añadir.
    ///
    /// Notas para principiantes:
    /// - `ToolbarItem` agrega botones a la barra de navegación.
    /// - `.buttonStyle(.plain)` elimina estilos para que el botón parezca un ícono simple.
    var body: some View {
        List {
            ForEach(store.tasks) { t in
                HStack {
                    Button {
                        toggleDone(t)
                    } label: {
                        Image(systemName: t.isDone ? "checkmark.circle.fill" : "circle")
                    }
                    .buttonStyle(.plain)

                    VStack(alignment: .leading) {
                        Text(t.title)
                        Text(t.createdAt.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Tareas")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAdd) {
            AddTaskView()
        }
    }

    /// Alterna el estado de completado de una tarea.
    /// - Parameter t: Tarea a actualizar.
    ///
    /// Para principiantes: se busca el índice de la tarea y se invierte su valor `isDone`.
    private func toggleDone(_ t: TaskItem) {
        guard let idx = store.tasks.firstIndex(where: { $0.id == t.id }) else { return }
        store.tasks[idx].isDone.toggle()
    }

    /// Elimina las tareas en los índices indicados por el sistema.
    /// - Parameter offsets: Índices a eliminar.
    ///
    /// Nota: `List` provee estos índices cuando el usuario desliza para eliminar.
    private func delete(at offsets: IndexSet) {
        store.tasks.remove(atOffsets: offsets)
    }
}

