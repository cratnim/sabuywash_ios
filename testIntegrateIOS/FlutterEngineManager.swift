import Flutter

class FlutterEngineManager {
    static let shared = FlutterEngineManager()
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    let flavor: String

    private init() {
        self.flavor = Bundle.main.infoDictionary?["FLAVOR"] as? String ?? "prod"
        
        print("Current Flavor: \(flavor)")
        
        flutterEngine.run(
            withEntrypoint: nil,
            libraryURI: nil,
            initialRoute: nil,
            entrypointArgs: [flavor]
        )
    }

    func getEngine() -> FlutterEngine {
        if flutterEngine.viewController != nil {
            flutterEngine.viewController = nil
        }
        return flutterEngine
    }
}
