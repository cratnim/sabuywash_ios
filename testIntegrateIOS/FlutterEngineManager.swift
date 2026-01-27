import Flutter

class FlutterEngineManager {
    static let shared = FlutterEngineManager()
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    
    private init() {
        flutterEngine.run()
    }
}
