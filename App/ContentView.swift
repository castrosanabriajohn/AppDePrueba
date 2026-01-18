import SwiftUI

/// Ejemplo de vista simple en SwiftUI.
///
/// Para principiantes:
/// - `VStack` organiza elementos en una columna vertical.
/// - `Image(systemName:)` usa íconos de SF Symbols.
/// - `Text` muestra texto básico.
/// - `.padding()` agrega espacio alrededor del contenido.
struct ContentView: View {
    /// Cuerpo de la vista.
    /// - Returns: Una pila vertical con un ícono y un texto de ejemplo.
    var body: some View {
        VStack {
            /*
             Conceptos:
             - `.imageScale(.large)` cambia el tamaño del ícono.
             - `.foregroundStyle(.tint)` aplica el color de acento de la app.
             - `#Preview` (abajo) permite ver la vista en tiempo real en Xcode.
            */
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
