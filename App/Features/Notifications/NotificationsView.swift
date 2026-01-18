//
//  NotificationsView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Pantalla que muestra la lista de notificaciones.
///
/// Para principiantes:
/// - Las notificaciones se ordenan por fecha (más recientes arriba).
/// - Al tocar una notificación, se marca como leída.
/// - En la barra superior hay una acción para marcar todas como leídas.
struct NotificationsView: View {
    /// `AppStore` con la lista de notificaciones compartidas.
    @EnvironmentObject private var store: AppStore

    /// Cuerpo de la vista.
    /// - Returns: Una lista de notificaciones con acciones de lectura.
    ///
    /// Para principiantes: `.contentShape(Rectangle())` permite detectar toques en toda el área de la celda.
    var body: some View {
        List {
            ForEach(store.notifications.sorted(by: { $0.date > $1.date })) { n in
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(n.title).font(.headline)
                        Spacer()
                        if !n.isRead {
                            Text("Nuevo")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(.thinMaterial)
                                .clipShape(Capsule())
                        }
                    }
                    Text(n.message).foregroundStyle(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    markAsRead(n)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Notificaciones")
        .toolbar {
            Button("Marcar todo leído") {
                for i in store.notifications.indices {
                    store.notifications[i].isRead = true
                }
            }
        }
    }

    /// Marca como leída una notificación específica.
    /// - Parameter n: Notificación a actualizar dentro del `store`.
    ///
    /// Nota: Se busca el índice y se cambia `isRead` a `true`.
    private func markAsRead(_ n: AppNotification) {
        guard let idx = store.notifications.firstIndex(where: { $0.id == n.id }) else { return }
        store.notifications[idx].isRead = true
    }
}

