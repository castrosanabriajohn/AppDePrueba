//
//  MyTestApp.swift
//  AppDePrueba
//
//  Created by John Benjamín Castro Sanabria on 17/1/26.
//

import SwiftUI

/// Punto de entrada de la aplicación.
///
/// Para principiantes:
/// - La anotación `@main` indica al sistema dónde comienza la app.
/// - Un tipo que conforma el protocolo `App` define la escena principal y el contenido inicial.
/// - Aquí creamos e inyectamos objetos de estado compartido (`SessionManager` y `AppStore`) para que
///   estén disponibles en toda la jerarquía de vistas.
@main
struct MyTestApp: App {
    /// Gestor de sesión creado una sola vez para toda la app.
    ///
    /// Para principiantes:
    /// - `@StateObject` mantiene vivo el objeto mientras la vista `App` exista.
    /// - Se inyecta como `@EnvironmentObject` en las vistas hijas para acceder a su estado.
    @StateObject private var session = SessionManager(authService: MockAuthService())
    
    /// Almacén de datos compartidos (usuario, tareas, notificaciones) para toda la app.
    ///
    /// Con `@StateObject` garantizamos un único `AppStore` para la vida de la aplicación.
    @StateObject private var store = AppStore()

    /// Define la(s) escena(s) de la aplicación.
    /// - Returns: Una `WindowGroup` que contiene la vista raíz (`RootView`).
    ///
    /// Para principiantes:
    /// - `WindowGroup` es el contenedor de ventanas principal en iOS/iPadOS/macOS con SwiftUI.
    var body: some Scene {
        WindowGroup {
            RootView()
            /*
             Inyección de dependencias en el entorno de SwiftUI:
             - `.environmentObject(session)` y `.environmentObject(store)` hacen que estos objetos
               estén disponibles para cualquier vista descendiente que declare `@EnvironmentObject`.
             - Esto evita pasar referencias manualmente por cada vista.
            */
                .environmentObject(session)
                .environmentObject(store)
        }
    }
}

