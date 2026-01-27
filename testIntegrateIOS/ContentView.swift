import SwiftUI

struct ContentView: View {
    @State private var showFlutter = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Open Flutter Screen") {
                    showFlutter = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: $showFlutter) {
                FlutterViewRepresentable()
            }
        }
    }
}

#Preview {
    ContentView()
}
