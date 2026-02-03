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
            .fullScreenCover(isPresented: $showFlutter) {
                ZStack(alignment: .topLeading) {
                    FlutterViewRepresentable()
                        .ignoresSafeArea()
                    
                    Button(action: {
                        showFlutter = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.top, 20)
                            .padding(.leading, 20)
                    }
                }
}
        }
    }
}

#Preview {
    ContentView()
}
