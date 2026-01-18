//
//  MainTabView.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//
//  Vista principal de pestañas de la aplicación. Aquí se organizan
//  las secciones clave de la app (Home, Mis Datos, Config, Notif y Tareas)
//  utilizando un TabView. Cada pestaña está envuelta en un NavigationStack
//  para permitir navegación jerárquica dentro de esa sección.
//

import SwiftUI

/// Vista principal de la aplicación que muestra una barra de pestañas (Tab Bar).
///
/// Para principiantes:
/// - Un `TabView` crea una interfaz con pestañas en la parte inferior.
///   Cada pestaña representa una sección distinta (Inicio, Mis Datos, Configuración, Notificaciones, Tareas).
/// - Dentro de cada pestaña usamos `NavigationStack`, que agrega una barra de navegación
///   y permite moverse hacia pantallas secundarias dentro de esa sección (historial de navegación propio).
/// - El modificador `.tabItem` define el título e ícono que verás en la barra de pestañas.
/// - El modificador `.badge` muestra un número sobre el ícono (por ejemplo, notificaciones sin leer).
///
/// Esta vista no maneja lógica de negocio; solo organiza la navegación principal.
struct MainTabView: View {
    /// Acceso al estado global de la app mediante `@EnvironmentObject`.
    ///
    /// Para principiantes:
    /// - `@EnvironmentObject` permite compartir un objeto entre muchas vistas sin pasarlo
    ///   manualmente como parámetro. Aquí usamos `AppStore`, que contiene datos como
    ///   notificaciones y tareas.
    /// - Este objeto se inyecta en la jerarquía de vistas en `MyTestApp` usando `.environmentObject(...)`.
    /// - Cambios en `AppStore` (propiedades con `@Published`) actualizan automáticamente la UI.
    @EnvironmentObject private var store: AppStore

    /// Cuerpo de la vista.
    /// - Returns: Un `TabView` con cinco pestañas principales, cada una envuelta en su propio `NavigationStack`.
    ///
    /// Explicación para principiantes:
    /// - Piensa en `TabView` como un contenedor que muestra solo una de sus secciones a la vez.
    /// - Cada sección tiene su navegación independiente gracias a `NavigationStack`.
    /// - Los `Label` de `.tabItem` combinan un texto y un ícono del sistema (`SF Symbols`).
    var body: some View {
        // Contenedor principal con pestañas.
        /*
         Conceptos clave:
         - TabView: contenedor que muestra una barra de pestañas y cambia de contenido al tocar cada ícono.
         - NavigationStack: añade navegación jerárquica (push/pop) dentro de cada pestaña.
         - .tabItem: define el título e ícono de la pestaña.
         - .badge: muestra un indicador numérico (por ejemplo, cantidad de notificaciones sin leer).
        */
        TabView {
            // Pestaña: Inicio (Home)
            // NavigationStack crea el historial de navegación propio de esta pestaña.
            NavigationStack {
                // Vista raíz de la sección Home.
                HomeView()
            }
            // Elemento de la pestaña con título e ícono del sistema.
            .tabItem { Label("Home", systemImage: "house") }

            // Pestaña: Perfil / Mis Datos
            NavigationStack {
                // Vista raíz de la sección de perfil del usuario.
                ProfileView()
            }
            .tabItem { Label("Mis Datos", systemImage: "person") }

            // Pestaña: Configuración
            NavigationStack {
                // Vista raíz de la sección de ajustes/configuración.
                SettingsView()
            }
            .tabItem { Label("Config", systemImage: "gearshape") }

            // Pestaña: Notificaciones
            NavigationStack {
                // Vista raíz de la sección de notificaciones.
                NotificationsView()
            }
            .tabItem { Label("Notif", systemImage: "bell") }
            // Insignia que muestra el número de notificaciones sin leer.
            .badge(store.unreadNotificationsCount)
            // Muestra una "badge" con el número de notificaciones sin leer.
            // Nota: si `unreadNotificationsCount` es 0, el sistema puede mostrar "0".
            // Si prefieres ocultar la insignia cuando el valor es 0, puedes usar:
            // .badge(store.unreadNotificationsCount == 0 ? nil : store.unreadNotificationsCount)

            // Pestaña: Tareas
            NavigationStack {
                // Vista raíz de la sección de tareas.
                TasksView()
            }
            .tabItem { Label("Tareas", systemImage: "checklist") }
        }
    }
}

